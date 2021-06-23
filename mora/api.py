import copy
import os
import re
import sys
import numpy as np
import pandas as pd
import subprocess as SP
import multiprocessing as MP
#from mod2map import mod2map
import torch
import MNSIM

maestro_layer_type_ref_dicts = {"Linear": "CONV", "CONV": "CONV", "DWCONV": "DSCONV", "Residual": "DSCONV", "TRCONV": "TRCONV", "NGCONV": "NGCONV"}
mora_layer_type_dicts = {0: "Linear", 1: "CONV", 2: "DWCONV", 3: "Residual", 4: "TRCONV", 5: "NGCONV"}  # DWCONV Residual is DSCONV on maestro
mora_layer_param_dicts = {
    'O': 'output_channel',
    'I': 'input_channel',
    'F': 'feature_size',
    'K': 'kernel_size',
    'S': 'stride',
    'T': 'layer_type',
    'R': 'relu_or_relu&pooling',
    'A': 'appending index'
}  # RP = 0:no relu, 1:relu, 2~:relu and pooling (kernel size)  A = (default 0) conv input index / fc is first layer for MNSIM

MLTRD = maestro_layer_type_ref_dicts
MLTD = mora_layer_type_dicts
MLPD = mora_layer_param_dicts


def EDP(model, home_path):
    # return {'dla': DLA.get_edp(model), 'rram': RRAM.get_edp(model)}
    dla_output_csv_path = os.path.abspath(os.path.join(home_path, 'output/' + model + '/' + model + '-dla.csv'))
    rram_output_csv_path = os.path.abspath(os.path.join(home_path, 'output/' + model + '/' + model + '-rram.csv'))
    if os.path.exists(dla_output_csv_path) is not True or os.path.exists(dla_output_csv_path) is not True:
        print("api.read outfile conflict.")
        raise AttributeError
    dla_out = pd.read_csv(dla_output_csv_path)
    rram_out = pd.read_csv(rram_output_csv_path)
    dla_edp = float(dla_out.at[0, 'energy']) * float(dla_out.at[0, 'latency'])
    rram_edp = float(rram_out.at[0, 'energy']) * float(rram_out.at[0, 'latency'])
    print("[mora][EDP] DLA: {}, RRAM: {}".format(dla_edp, rram_edp))
    return {'dla': dla_edp, 'rram': rram_edp}


def area(model, home_path):
    dla_output_csv_path = os.path.abspath(os.path.join(home_path, 'output/' + model + '/' + model + '-dla.csv'))
    rram_output_csv_path = os.path.abspath(os.path.join(home_path, 'output/' + model + '/' + model + '-rram.csv'))
    if os.path.exists(dla_output_csv_path) is not True or os.path.exists(dla_output_csv_path) is not True:
        print("api.read outfile conflict.")
        raise AttributeError
    dla_out = pd.read_csv(dla_output_csv_path)
    rram_out = pd.read_csv(rram_output_csv_path)
    dla_area = float(dla_out.at[0, 'area'])
    rram_area = float(rram_out.at[0, 'area'])
    print("[mora][area] DLA: {}, RRAM: {}".format(dla_area, rram_area))
    return {'dla': dla_area, 'rram': rram_area}


def gemmv1(home_path, model, dataflow):
    # generate maestro model using maestro api
    model_path = os.path.abspath(os.path.join(home_path, 'model/' + model))
    maestro_model_csv_path = os.path.abspath(os.path.join(model_path, model + '-dla.csv'))
    maestro_model_path = os.path.abspath(os.path.join(model_path, model + '-dla_model.m'))
    maestro_mapping_path = os.path.abspath(os.path.join(model_path, model + '-dla_' + dataflow + '.m'))
    dataflow_path = os.path.abspath(os.path.join(home_path, 'maestro/tools/frontend/dataflow/' + dataflow + '.m'))
    dpt_path = os.path.abspath(os.path.join(home_path, 'maestro/tools/frontend/dataflow/dpt.m'))

    # csv to maestro model
    model_ndarray = pd.read_csv(maestro_model_csv_path).to_numpy()
    model_layer_num = model_ndarray.shape[0]
    with open(maestro_model_path, 'w') as fo:
        fo.write("Network {} {{\n".format(model))
        for line in range(model_layer_num):
            layer = model_ndarray[line, ...]
            KCRSYX = [layer[0], layer[1], layer[3], layer[3], layer[2], layer[2]]
            fo.write("Layer L{} {{\n".format(line))
            fo.write("Type: {} \n".format(MLTRD[MLTD[layer[5]]]))
            fo.write("Stride {{ X: {}, Y: {} }}\n".format(layer[4], layer[4]))
            fo.write("Dimensions {{ K: {0[0]}, C: {0[1]}, R: {0[2]}, S: {0[3]}, Y: {0[4]}, X: {0[5]} }}\n".format(KCRSYX))
            fo.write("}\n")
        fo.write("}")
    print("[mora][gemmv1] Done csv to maestro model.")

    # maestro model to meastro mapping model
    dsconv = False
    with open(dataflow_path, 'r') as fd:
        with open(dpt_path, 'r') as fdpt:
            with open(maestro_mapping_path, 'w') as fo:
                with open(maestro_model_path, 'r') as fm:
                    for line in fm:
                        if (re.search("DSCONV", line)):
                            dsconv = True
                        if (re.search("Dimensions", line)):
                            fo.write(line)
                            if (dsconv):
                                fdpt.seek(0)
                                fo.write(fdpt.read())
                            else:
                                fd.seek(0)
                                fo.write(fd.read())
                            dsconv = False
                        else:
                            fo.write(line)
    print("[mora][gemmv1] Done maestro model to mapping.")
    return


def gemmv2(model):
    # generate maestro model with using keras and maestro api
    return
