'''
Mora-DSE BLURSONG 2021
A greedy and singel model version

HW variable params:
--------------------------------------------------------------------------------------------------------------------------
HW       |  latancy      area      power     energy    |
MNSIM    |  ns           um2       W         nJ        |   ①Tile BW = GB/s      ②Tile nums(1d, of a chip)
maestro  |  cycles/ns    um2       uW        nJ        |   ①NoC BW  = KB/s      ②PE nums                     L2 = Byte
mora     |  ns           um2       W         nJ        |    Top BW = GB/s                                     L2 = MB
--------------------------------------------------------------------------------------------------------------------------
Scenarios:
-------------------------------------------------------------------------
Scenario     |  PEs       Tiles                 BW/GB/s       L2(GLB)/MB
embedded     |  1024      12 * 12  1  chip      16            4
edge         |  4096      24 * 24  4  chip      64            8
cloud        |  16384     48 * 48  16 chip      256           16
-------------------------------------------------------------------------

'''
import copy
import os
import sys
import argparse
from typing import Container
import numpy as np
import pandas as pd
import subprocess as SP
import multiprocessing as MP
import torch
import MNSIM
import mora


def set_path(model, dataflow):
    global home_path, hw_config_path
    home_path = os.path.dirname(__file__)
    hw_config_path = os.path.abspath(os.path.join(home_path, "hw_config.m"))
    MNSIM_path = os.path.abspath(os.path.join(home_path, "MNSIM"))
    maestro_path = os.path.abspath(os.path.join(home_path, "maestro"))
    output_path = os.path.join(home_path, 'output/' + model)
    if os.path.exists(output_path):
        SP.run('rm *.csv', cwd=output_path, shell=True)
    sys.path.append(home_path)
    sys.path.append(MNSIM_path)
    sys.path.append(maestro_path)


def set_parser():
    parser = argparse.ArgumentParser(description='mora dse parser')
    parser.add_argument('--dataflow', type=str, default='kcp_ws', choices=['ykp_os', 'yxp_os', 'kcp_ws', 'xp_ws', 'rs'])
    parser.add_argument('--model', type=str, default='vgg16')
    parser.add_argument('--scenario', type=str, default='edge', choices=['embedded', 'edge', 'cloud'])
    return parser


def hw_init(hw_config_path):
    hw_dicts = {}
    with open(hw_config_path, 'r') as fs:
        for lines in fs:
            try:
                params, values = lines.split(':')
                hw_dicts[params.strip()] = int(values.strip())
            except ValueError:
                print("check your config file.")
    return hw_dicts


def set_hw_range(scenario):
    if scenario == 'embedded':
        mpes = 1024
        mtiles = 16
        mglb_size = 6  # MB
        mbw = 16  # GB/s
    elif scenario == 'edge':
        mpes = 4096
        mtiles = 32
        mglb_size = 10
        mbw = 64
    elif scenario == 'cloud':
        mpes = 16384
        mtiles = 64
        mglb_size = 20
        mbw = 256
    max_hw_param_dicts = {}
    max_hw_param_dicts['pes'] = mpes
    max_hw_param_dicts['tiles'] = mtiles
    max_hw_param_dicts['glb_size'] = mglb_size
    max_hw_param_dicts['bw'] = mbw
    return max_hw_param_dicts


if __name__ == "__main__":
    args = set_parser().parse_args()
    set_path(args.model, args.dataflow)
    hw_param_dicts = hw_init(hw_config_path)
    max_hw_param_dicts = set_hw_range(args.scenario)
    dla = mora.HW.DLA(max_hw_param_dicts, args.dataflow, home_path)
    rram = mora.HW.RRAM(max_hw_param_dicts, home_path)
    mora.api.remove_csv_bn(home_path, args.model)
    mora.api.gemm(home_path, args.model, args.dataflow)
    # TODO: new workload

    print("[mora] init indicator.")
    dla.invoke_maestro(args.model)
    dla.export(args.model)
    rram.invoke_MNSIM(args.model, args.dataflow)
    edp_cons = mora.api.EDP(args.model, args.dataflow, home_path)
    area_cons = mora.api.area(args.model, args.dataflow, home_path)
    mora.schedule.greedy_schedule(DLA=dla,
                                  RRAM=rram,
                                  model=args.model,
                                  EDP_cons=edp_cons,
                                  area_cons=area_cons,
                                  hw_param_dicts=hw_param_dicts,
                                  max_param_dicts=max_hw_param_dicts)
    # TODO: new schedule

    mora.schedule.fifo_schedule(DLA=dla,
                                RRAM=rram,
                                model=args.model,
                                EDP_cons=edp_cons,
                                area_cons=area_cons,
                                hw_param_dicts=hw_param_dicts,
                                max_param_dicts=max_hw_param_dicts)
