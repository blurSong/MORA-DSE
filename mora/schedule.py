import copy
import os
import sys
import numpy as np
import pandas as pd
import subprocess as SP
import multiprocessing as MP
import torch
import MNSIM
import mora.HW
from mora.api import dse_checkpoint


def greedy_schedule(DLA, RRAM, model, EDP_cons, area_cons, hw_param_dicts, max_param_dicts):
    assert DLA.home_path == RRAM.home_path
    homepath = RRAM.home_path
    maestro_result_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/' + model + '_dla_' + DLA.dataflow + '.csv'))
    model_csv_path = os.path.abspath(os.path.join(homepath, 'model/' + model + '/' + model + '.csv'))
    shirink_num = 2.5
    expand_num = 2
    # greedy
    rounds = 128 * (1 - 1 / (shirink_num * expand_num)) * (max_param_dicts['tile_size'] *
                                                           (1 - 1 / (shirink_num * expand_num)) / 2)**2 * 32 * (7 / 8) * (1 - 1 / (shirink_num * expand_num))
    print('[mora] Greedy DSE, Total Rounds:', int(rounds))
    assert rounds <= 114514 * 1.810
    DSE_indicator = 1
    for pes in range(int(hw_param_dicts['dla_pes'] / shirink_num), max_param_dicts['pes'], int(max_param_dicts['pes'] / 128)):
        for rts_r in range(int(hw_param_dicts['rram_tile_size'] / shirink_num), max_param_dicts['tile_size'], 2):
            for rts_c in range(int(hw_param_dicts['rram_tile_size'] / shirink_num), max_param_dicts['tile_size'], 2):
                for dbw in range(int(hw_param_dicts['dla_noc_bw'] / (shirink_num * 1024 * 1024)), int(max_param_dicts['bw'] * 7 / 8),
                                 int(max_param_dicts['bw'] / 32)):  # Kbyte to GB
                    rbw = max_param_dicts['bw'] - dbw
                    print('[mora] Start DSE', DSE_indicator)
                    DLA.set_dse_param(pes, dbw * 1024 * 1024, DSE_indicator)
                    RRAM.set_dse_param(rts_r, rts_c, rbw, DSE_indicator)
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
                            layer_mem_cap = model_csv_nd[layer_index, 0] * model_csv_nd[layer_index, 1] * model_csv_nd[layer_index, 3]**2 * 16 * 2
                            if (kernel_mem_cap + layer_mem_cap) <= RRAM.mem_capacity:
                                kernel_mem_cap += layer_mem_cap
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
    print("[mora] DSE finish.")
    return
