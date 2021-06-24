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

# MNSIM    ns      um2    W    nJ
# maestro cycle/ns um2    W    nJ


def set_path(model):
    global home_path, hw_config_path
    home_path = os.path.dirname(__file__)
    hw_config_path = os.path.abspath(os.path.join(home_path, "hw_config.m"))
    model_path = os.path.abspath(os.path.join(home_path, "model"))
    MNSIM_path = os.path.abspath(os.path.join(home_path, "MNSIM"))
    maestro_path = os.path.abspath(os.path.join(home_path, "maestro"))
    model_csv_path = os.path.join(model_path, model + '/' + model + '.csv')
    dla_model_csv_path = os.path.join(model_path, model + '/' + model + '-dla.csv')
    rram_model_csv_path = os.path.join(model_path, model + '/' + model + '-rram.csv')
    SP.run("cp -f {} {}".format(model_csv_path, dla_model_csv_path), shell=True)
    SP.run("cp -f {} {}".format(model_csv_path, rram_model_csv_path), shell=True)
    sys.path.append(home_path)
    sys.path.append(MNSIM_path)
    sys.path.append(maestro_path)


def set_parser():
    parser = argparse.ArgumentParser(description='mora dse parser')
    parser.add_argument('--dataflow', type=str, default='kcp_ws')
    parser.add_argument('--model', type=str, default='vgg16')
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


if __name__ == "__main__":
    args = set_parser().parse_args()
    set_path(args.model)
    hw_param_dicts = hw_init(hw_config_path)
    dla = mora.HW.DLA(hw_param_dicts, args.dataflow, home_path)
    rram = mora.HW.RRAM(hw_param_dicts, home_path)
    mora.api.gemmv1(home_path, args.model, args.dataflow)
    dla.invoke_maestro(args.model)
    rram.invoke_MNSIM(args.model)
    edp_cons = mora.api.EDP(args.model, home_path)
    area_cons = mora.api.area(args.model, home_path)

    mora.schedule.greedy_schedule(DLA=dla, RRAM=rram, model=args.model, EDP_cons=edp_cons, area_cons=area_cons)
    # TODO:  mora.schedule.mora_schedule(DLA=dla, RRAM=rram, model=model, EDP_cons=edp_cons, area_cons=area_cons)
