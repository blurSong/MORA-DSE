#!/usr/bin/python
# -*-coding:utf-8-*-
import torch
import sys
import os
import math
import argparse
import numpy as np
import pandas as pd
import torch
import collections
import configparser
import copy
from importlib import import_module
from MNSIM.Interface.interface import *
from MNSIM.Accuracy_Model.Weight_update import weight_update
from MNSIM.Mapping_Model.Behavior_mapping import behavior_mapping
from MNSIM.Mapping_Model.Tile_connection_graph import TCG
from MNSIM.Latency_Model.Model_latency import Model_latency
from MNSIM.Area_Model.Model_Area import Model_area
from MNSIM.Power_Model.Model_inference_power import Model_inference_power
from MNSIM.Energy_Model.Model_energy import Model_energy


def Data_clean():
    path = os.getcwd()
    NoC_file = path + '/MNSIM/NoC/'
    inj_file = 'inj_dir'
    log_file = 'log'
    res_file = 'Final_Results'
    files = os.listdir(NoC_file)
    for file in files:
        if file == inj_file:
            for target in os.listdir(NoC_file + inj_file):
                os.remove(NoC_file + inj_file + '/' + target)
        elif file == log_file:
            for target in os.listdir(NoC_file + log_file):
                os.remove(NoC_file + log_file + '/' + target)
        elif file == res_file:
            for target in os.listdir(NoC_file + res_file):
                os.remove(NoC_file + res_file + '/' + target)
        else:
            continue
    # print("Removed unnecessary file.")


def main(_model='vgg16', _tiles=24, _tiles_buildin=24, _noc_bw=20, _DSE_indicator=0, _dataflow='kcp_ws', _on_RRAM_layer_index=[]):

    home_path = os.getcwd()
    SimConfig_path = os.path.join(home_path, "rram_config.ini")
    weights_file_path = os.path.join(home_path, "MNSIM/params/cifar10_vgg16_params.pth")
    parser = argparse.ArgumentParser(description='MNSIM mora edition')

    # default args
    parser.add_argument("-AutoDelete", "--file_auto_delete", default=True, help="Whether delete the unnecessary files automatically")
    parser.add_argument("-HWdes",
                        "--hardware_description",
                        default=SimConfig_path,
                        help="Hardware description file location & name, default:/mora/rram_config.ini")
    parser.add_argument("-Weights",
                        "--weights",
                        default=weights_file_path,
                        help="NN model weights file location & name, default:/MNSIM_Python/cifar10_vgg18_params.pth")
    parser.add_argument("-DisHW", "--disable_hardware_modeling", action='store_true', default=False, help="Disable hardware modeling, default: false")
    parser.add_argument("-DisAccu", "--disable_accuracy_simulation", action='store_true', default=True, help="Disable accuracy simulation, default: false")
    parser.add_argument("-SAF", "--enable_SAF", action='store_true', default=False, help="Enable simulate SAF, default: false")
    parser.add_argument("-Var", "--enable_variation", action='store_true', default=False, help="Enable simulate variation, default: false")
    parser.add_argument("-Rratio", "--enable_R_ratio", action='store_true', default=False, help="Enable simulate the effect of R ratio, default: false")
    parser.add_argument("-FixRange",
                        "--enable_fixed_Qrange",
                        action='store_true',
                        default=True,
                        help="Enable fixed quantization range (max value), default: false")
    parser.add_argument("-DisPipe",
                        "--disable_inner_pipeline",
                        action='store_true',
                        default=True,
                        help="Disable inner layer pipeline in latency modeling, default: false")
    parser.add_argument("-D", "--device", default=1, help="Determine hardware device for simulation, default: CPU")
    parser.add_argument("-DisModOut",
                        "--disable_module_output",
                        action='store_true',
                        default=True,
                        help="Disable module simulation results output, default: false")
    parser.add_argument("-DisLayOut",
                        "--disable_layer_output",
                        action='store_true',
                        default=True,
                        help="Disable layer-wise simulation results output, default: false")

    # mora args
    parser.add_argument("--model", type=str, default='vgg16', help="NN model name, default: vgg16")
    parser.add_argument("--tiles", nargs='+', type=int, default=24, help="tiles [row, col] of a chip")
    parser.add_argument("--noc_bw", type=int, default=20)
    parser.add_argument("--dataflow", type=str, default='kcp_ws')
    parser.add_argument('--scenario', type=str, default='edge', choices=['embedded', 'edge', 'cloud'])

    args = parser.parse_args()
    if args.file_auto_delete:
        # print("use the root mode by 'sudo -s'")
        Data_clean()
    else:
        print("You should make sure that the files are removed which may cause confusions")
    '''
    print("Hardware description file location:", args.hardware_description)
    print("Software model file location:", args.weights)
    print("Whether perform hardware simulation:", not (args.disable_hardware_modeling))
    print("Whether perform accuracy simulation:", not (args.disable_accuracy_simulation))
    print("Whether consider SAFs:", args.enable_SAF)
    print("Whether consider variations:", args.enable_variation)
    if args.enable_fixed_Qrange:
        print("Quantization range: fixed range (depends on the maximum value)")
    else:
        print("Quantization range: dynamic range (depends on the data distribution)")
    '''

    if __name__ != '__main__':
        args.model = _model
        args.tiles = _tiles
        args.noc_bw = _noc_bw
        args.dataflow = _dataflow
        tiles_buildin = _tiles_buildin
        mora_skip_simu = False

    if _on_RRAM_layer_index:
        on_RRAM_layer_index = copy.deepcopy(_on_RRAM_layer_index)  # on_RRAM_layer_index is out of order
    elif _DSE_indicator == 0:
        model_csv_path = os.path.abspath(os.path.join(os.path.dirname(__file__), 'model/' + args.model + '/' + args.model + '.csv'))
        model_nd = pd.read_csv(model_csv_path).to_numpy()
        model_layer_num = model_nd.shape[0]
        on_RRAM_layer_index = range(model_layer_num)
    else:  # indicates no layers RRAM can excu
        on_RRAM_layer_index = []
        mora_skip_simu = True
        print('No layers RRAM can excute. Skip')

    output_csv_dicts = {}
    output_csv_dicts['DSE index'] = _DSE_indicator
    output_csv_dicts['layers'] = len(on_RRAM_layer_index)
    __TestInterface = TrainTestInterface(network_module=args.model,
                                         dataset_module='MNSIM.Interface.cifar10',
                                         SimConfig_path=args.hardware_description,
                                         on_RRAM_layer_index=on_RRAM_layer_index,
                                         weights_file=args.weights,
                                         device=args.device)
    structure_file = __TestInterface.get_structure()
    on_RRAM_layer_index2 = __TestInterface.on_RRAM_layer_index2
    # TCG_mapping = TCG(structure_file, args.hardware_description, args.disable_inner_pipeline, args.tiles)
    TCG_mapping = TCG(structure_file, args.hardware_description, args.disable_inner_pipeline, tiles_buildin)

    if not (args.disable_hardware_modeling) and not (mora_skip_simu):
        __latency = Model_latency(NetStruct=structure_file, SimConfig_path=args.hardware_description, TCG_mapping=TCG_mapping, inter_tile_bandwidth=args.noc_bw)
        if not (args.disable_inner_pipeline):
            __latency.calculate_model_latency(mode=1)
        else:
            __latency.calculate_model_latency_nopipe()
        # print("========================Latency Results=================================")
        output_csv_dicts['latency'] = __latency.model_latency_output(not (args.disable_module_output), not (args.disable_layer_output), on_RRAM_layer_index2)

        __area = Model_area(NetStruct=structure_file, SimConfig_path=args.hardware_description, TCG_mapping=TCG_mapping)
        # print("========================Area Results=================================")
        output_csv_dicts['area'] = __area.model_area_output(not (args.disable_module_output), not (args.disable_layer_output), on_RRAM_layer_index2)

        __power = Model_inference_power(NetStruct=structure_file, SimConfig_path=args.hardware_description, TCG_mapping=TCG_mapping)
        # print("========================Power Results=================================")
        output_csv_dicts['power'] = __power.model_power_output(not (args.disable_module_output), not (args.disable_layer_output), on_RRAM_layer_index2)

        __energy = Model_energy(NetStruct=structure_file,
                                SimConfig_path=args.hardware_description,
                                TCG_mapping=TCG_mapping,
                                model_latency=__latency,
                                model_power=__power)
        # print("========================Energy Results=================================")
        output_csv_dicts['energy'] = __energy.model_energy_output(not (args.disable_module_output), not (args.disable_layer_output), on_RRAM_layer_index2)
    else:
        output_csv_dicts['latency'] = 0
        output_csv_dicts['area'] = 0
        output_csv_dicts['power'] = 0
        output_csv_dicts['energy'] = 0

    if not (args.disable_accuracy_simulation):
        print("======================================")
        print("Accuracy simulation will take a few minutes on GPU")
        weight = __TestInterface.get_net_bits()
        weight_2 = weight_update(args.hardware_description, weight, is_Variation=args.enable_variation, is_SAF=args.enable_SAF, is_Rratio=args.enable_R_ratio)
        if not (args.enable_fixed_Qrange):
            print("Original accuracy:", __TestInterface.origin_evaluate(method='FIX_TRAIN', adc_action='SCALE'))
            print("PIM-based computing accuracy:", __TestInterface.set_net_bits_evaluate(weight_2, adc_action='SCALE'))
        else:
            print("Original accuracy:", __TestInterface.origin_evaluate(method='FIX_TRAIN', adc_action='FIX'))
            print("PIM-based computing accuracy:", __TestInterface.set_net_bits_evaluate(weight_2, adc_action='FIX'))

    # write mora csv
    output_csv_dicts['HW (tiles, bw)'] = '{} {}'.format(args.tiles, args.noc_bw)
    output_csv_dicts['restraint'] = 'unexamined' if _DSE_indicator != 0 else 'pass'
    output_csv_path = os.path.abspath(os.path.join(home_path, 'output/' + args.model + '/[' + args.dataflow + ']' + args.model + '_rram.csv'))
    csv = pd.DataFrame(output_csv_dicts, index=[_DSE_indicator])
    if os.path.exists(output_csv_path):
        csv.to_csv(output_csv_path, mode='a', header=False, index=False)
    else:
        csv.to_csv(output_csv_path, index=False)


if __name__ == '__main__':
    main()
