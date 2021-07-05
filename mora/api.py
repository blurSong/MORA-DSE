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


def EDP(model, home_path, indicator=0):
    # return {'dla': DLA.get_edp(model), 'rram': RRAM.get_edp(model)}
    dla_output_csv_path = os.path.abspath(os.path.join(home_path, 'output/' + model + '/' + model + '-dla.csv'))
    rram_output_csv_path = os.path.abspath(os.path.join(home_path, 'output/' + model + '/' + model + '-rram.csv'))
    if os.path.exists(dla_output_csv_path) is not True or os.path.exists(dla_output_csv_path) is not True:
        print("api.read outfile conflict.")
        raise AttributeError
    dla_out = pd.read_csv(dla_output_csv_path, skiprows=indicator, nrows=1)
    rram_out = pd.read_csv(rram_output_csv_path, skiprows=indicator, nrows=1)
    dla_edp = float(dla_out.at[0, 'energy']) * float(dla_out.at[0, 'latency'])
    rram_edp = float(rram_out.at[0, 'energy']) * float(rram_out.at[0, 'latency'])
    print("[mora][EDP] DLA: {:.4e}, RRAM: {:.4e}".format(dla_edp, rram_edp))
    return {'dla': dla_edp, 'rram': rram_edp}


def area(model, home_path, indicator=0):
    dla_output_csv_path = os.path.abspath(os.path.join(home_path, 'output/' + model + '/' + model + '-dla.csv'))
    rram_output_csv_path = os.path.abspath(os.path.join(home_path, 'output/' + model + '/' + model + '-rram.csv'))
    if os.path.exists(dla_output_csv_path) is not True or os.path.exists(dla_output_csv_path) is not True:
        print("api.read outfile conflict.")
        raise AttributeError
    dla_out = pd.read_csv(dla_output_csv_path, skiprows=indicator, nrows=1)
    rram_out = pd.read_csv(rram_output_csv_path, skiprows=indicator, nrows=1)
    dla_area = float(dla_out.at[0, 'area'])
    rram_area = float(rram_out.at[0, 'area'])
    print("[mora][area] DLA: {:.4e}, RRAM: {:.4e}".format(dla_area, rram_area))
    return {'dla': dla_area, 'rram': rram_area}


def gemmv1(home_path, model, dataflow):
    # generate maestro model using maestro api
    model_path = os.path.abspath(os.path.join(home_path, 'model/' + model))
    # maestro_model_csv_path = os.path.abspath(os.path.join(model_path, model + '-dla.csv'))
    maestro_model_csv_path = os.path.abspath(os.path.join(model_path, model + '.csv'))
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


def dse_checkpoint(indicator, EDP_cons, area_cons, model, homepath):
    # check csv result and save them
    edp_dse = EDP(model, homepath, indicator)
    area_dse = area(model, homepath, indicator)
    ii = edp_dse['dla'] > EDP_cons['dla'] & edp_dse['rram'] > EDP_cons['rram']
    jj = area_dse['dla'] > area_cons['dla'] & area_dse['rram'] > area_cons['rram']
    # TODO: advanced checking rules
    if ii | jj:
        DSE_checkpoint = False
    else:
        DSE_checkpoint = True
    dla_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/' + model + '-dla.csv'))
    rram_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/' + model + '-rram.csv'))
    dla_out_pd = pd.read_csv(dla_output_csv_path)
    rram_out_pd = pd.read_csv(rram_output_csv_path)
    assert dla_out_pd.at[indicator, 'restraint'] == 'unexamined'
    assert rram_out_pd.at[indicator, 'restraint'] == 'unexamined'
    if DSE_checkpoint is False:
        dla_out_pd.at[indicator, 'restraint'] = 'fail'
        rram_out_pd.at[indicator, 'restraint'] = 'fail'
        print('dse checkpoint fail.')
    else:
        dla_out_pd.at[indicator, 'restraint'] = 'pass'
        rram_out_pd.at[indicator, 'restraint'] = 'pass'
        print('dse checkpoint pass.')
    dla_out_pd.to_csv(dla_output_csv_path)
    rram_out_pd.to_csv(rram_output_csv_path)
    return
