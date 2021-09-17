'''
Mora dse
a greedy and singel model version
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

# MNSIM    ns      um2    W    nJ    bw=GByte
# maestro cycle/ns um2    uW    nJ   bw=KByte  glb=byte
# HW       L2 MiB    NOC GB/s


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
    parser.add_argument('--scenario', type=str, default='edge', choices=['edge', 'mobile', 'cloud'])  # see puma and maes
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
    if scenario == 'edge':
        mpes = 1024
        mtile_size = 12
        mglb_size = 6  # MiB
        mbw = 16  # GB/s
    elif scenario == 'mobile':
        mpes = 4096
        mtile_size = 24
        mglb_size = 10
        mbw = 64
    elif scenario == 'cloud':
        mpes = 16384
        mtile_size = 64
        mglb_size = 20
        mbw = 256
    max_hw_param_dicts = {}
    '''
    expand_num = 2
    max_hw_param_dicts['pes'] = hw_param_dicts['dla_pes'] * expand_num
    max_hw_param_dicts['tile_size'] = hw_param_dicts['rram_tile_size'] * expand_num
    max_hw_param_dicts['bw'] = (int(hw_param_dicts['dla_noc_bw'] / (1024 * 1024)) + hw_param_dicts['rram_tile_bw'])
    '''
    max_hw_param_dicts['pes'] = mpes
    max_hw_param_dicts['tile_size'] = mtile_size
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
    mora.api.gemm(home_path, args.model, args.dataflow)
    # TODO: new workload

    print("[mora] Init indicator.")
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
    '''
    mora.schedule.mora_schedule(DLA=dla,
                                RRAM=rram,
                                model=args.model,
                                EDP_cons=edp_cons,
                                area_cons=area_cons,
                                hw_param_dicts=hw_param_dicts,
                                max_param_dicts=max_hw_param_dicts)
    '''
