import copy
import os
import sys
import numpy as np
import pandas as pd
import subprocess as SP
import multiprocessing as MP
from math import ceil, floor
import torch
import MNSIM
import mora.HW
from mora.api import dse_checkpoint


def get_layer_memcap(in_channels, out_channels, kernel_size):
    xbar_size = 128
    xbar_hori_f = kernel_size * kernel_size * in_channels * 1.0 / xbar_size
    xbar_vert_f = out_channels * (16 / 2) / (xbar_size - 1.0)
    rram_xbars = ceil(xbar_hori_f) * ceil(xbar_vert_f)
    return rram_xbars * xbar_size**2 * 2.0


def greedy_schedule(DLA, RRAM, model, EDP_cons, area_cons, hw_param_dicts, max_param_dicts, scenario):
    assert DLA.home_path == RRAM.home_path
    homepath = RRAM.home_path
    if scenario == 'embedded':
        scenario_step = 1
    elif scenario == 'edge':
        scenario_step = 2
    elif scenario == 'cloud':
        scenario_step = 4
    else:
        raise AssertionError
    maestro_result_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/' + model + '_dla_' + DLA.dataflow + '.csv'))
    model_csv_path = os.path.abspath(os.path.join(homepath, 'model/' + model + '/' + model + '.csv'))
    # greedy
    # rounds = (int((max_param_dicts['pes'] - hw_param_dicts['pes']) / int(max_param_dicts['pes'] / 128)) + 1) * ((
    #    (max_param_dicts['tiles'] - hw_param_dicts['tiles']) / 2) + 1)**2 * ((
    #        (max_param_dicts['bw'] * 7 / 8) - hw_param_dicts['dla_bw']) / ceil(max_param_dicts['bw'] / 32))
    rounds = (((max_param_dicts['pes'] - hw_param_dicts['pes']) / (scenario_step**2 * 128)) + 1) \
        * (((max_param_dicts['tiles'] - hw_param_dicts['tiles']) / ceil(scenario_step/2.0)) + 1) \
        * (((max_param_dicts['bw'] * 0.8 - hw_param_dicts['dla_bw']) / (scenario_step**2)) + 1)
    print('[mora][DSE] Greedy DSE, total rounds:', int(rounds))
    print('Starting HW:', hw_param_dicts)
    print('Ending HW:', max_param_dicts, '\n')
    assert rounds < 11451.4, 'too many dse rounds.'
    DSE_indicator = 1
    for pes in range(hw_param_dicts['pes'], max_param_dicts['pes'], scenario_step**2 * 128):
        for tiles in range(hw_param_dicts['tiles'], max_param_dicts['tiles'], ceil(scenario_step / 2.0)):
            for dbw in range(hw_param_dicts['dla_bw'], int(max_param_dicts['bw'] * 0.8), scenario_step**2):
                rbw = max_param_dicts['bw'] - dbw
                print('[mora][DSE] Start greedy DSE round {0} / {1}'.format(DSE_indicator, rounds))
                DLA.set_dse_param(pes, dbw, DSE_indicator)
                RRAM.set_dse_param(tiles, rbw, DSE_indicator)
                # run 0: all on dla
                DLA.invoke_maestro(model)
                layers = 0
                try:
                    maestro_result_df = pd.read_csv(maestro_result_csv_path)
                    model_csv_df = pd.read_csv(model_csv_path)
                    model_csv_nd = model_csv_df.to_numpy(dtype=int)
                    layers = maestro_result_df.shape[0]
                    maestro_result_df.sort_values(by=' Runtime (Cycles)', ascending=False, inplace=True, kind='mergesort')  # use merge sort to stay stable
                    kernel_mem_cap = 0
                    on_RRAM_layer_index = []
                    for _, rows in maestro_result_df.iterrows():
                        layer_index = int(rows[' Layer Number'][1:])
                        layer_mem_cap = get_layer_memcap(model_csv_nd[layer_index, 0], model_csv_nd[layer_index, 1], model_csv_nd[layer_index, 3])
                        if (kernel_mem_cap + layer_mem_cap) <= RRAM.mem_capacity:
                            kernel_mem_cap = kernel_mem_cap + layer_mem_cap
                            on_RRAM_layer_index.append(layer_index)
                        else:
                            break
                except FileNotFoundError:
                    print("read maestro result fatal.")
                # run 0: get on-dla result
                # print(on_RRAM_layer_index)
                on_DLA_layer_index = []
                assert layers != 0
                for lyr in range(layers):
                    on_DLA_layer_index.append(lyr) if lyr not in on_RRAM_layer_index else None
                # print(on_DLA_layer_index)
                DLA.export(model, on_DLA_layer_index)
                # run 1: run and get on-rram result
                # rram_model_df = model_csv_df.iloc[on_RRAM_layer_index].copy()
                # rram_model_df.to_csv(rram_model_csv_path, index=False)  # replace old csv with new scheduled csv
                RRAM.invoke_MNSIM(model, DLA.dataflow, on_RRAM_layer_index)

                # set checkpoint
                dse_checkpoint(DSE_indicator, EDP_cons, area_cons, model, DLA.dataflow, homepath)
                DSE_indicator += 1
                print('\r')
    print("[mora][DSE] Finish.")
    return


def fifo_schedule(DLA, RRAM, model, EDP_cons, area_cons, hw_param_dicts, max_param_dicts):
    return


def heuristic_based_schedule(DLA, RRAM, model, EDP_cons, area_cons, hw_param_dicts, max_param_dicts):
    return


def mora_schedule(DLA, RRAM, model, EDP_cons, area_cons, hw_param_dicts, max_param_dicts):
    return
