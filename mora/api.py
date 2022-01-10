import os
import re
import sys
import numpy as np
import copy
import pandas as pd
from torch._C import CONV_BN_FUSION
# from mod2map import mod2map

maestro_layer_type_ref_dicts = {
    "Linear": "CONV",
    "CONV": "CONV",
    "DWCONV": "DSCONV",
    "Residual": "DSCONV",
    "TRCONV": "TRCONV",
    "NGCONV": "NGCONV",
    "VDP": "CONV",
    "VADD": "DSCONV",
    "VMUL": "VMUL",
    "GEMM": "GEMM"
}
mora_layer_type_dicts = {
    0: "Linear",
    1: "CONV",
    2: "DWCONV",
    3: "Residual",
    4: "Batchnorm",
    5: "TRCONV",
    6: "NGCONV",
    7: "VDP",
    8: "VADD",
    9: "VMUL",
    10: "GEMM"
}  # DWCONV is DSCONV for maestro
mora_layer_param_dicts = {
    'IC': 'input_channel',
    'OC': 'output_channel',
    'FS': 'feature_size',
    'KS': 'kernel_size',
    'STR': 'stride',
    'TYP': 'layer_type',
    'RP': 'relu_or_relu&pooling',
    'IDX': 'input index',
    'APD': 'appending_index'
}

MLTRD = maestro_layer_type_ref_dicts
MLTD = mora_layer_type_dicts
MLPD = mora_layer_param_dicts


def EDP(model, df, homepath, indicator=0):
    # return {'dla': DLA.get_edp(model), 'rram': RRAM.get_edp(model)}
    dla_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/[' + df + ']' + model + '_dla.csv'))
    rram_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/[' + df + ']' + model + '_rram.csv'))
    if os.path.exists(dla_output_csv_path) is not True or os.path.exists(dla_output_csv_path) is not True:
        print("api.read outfile conflict.")
        raise AttributeError
    dla_out = pd.read_csv(dla_output_csv_path)
    rram_out = pd.read_csv(rram_output_csv_path)
    dla_edp = float(dla_out.at[indicator, 'energy']) * float(dla_out.at[indicator, 'latency'])
    rram_edp = float(rram_out.at[indicator, 'energy']) * float(rram_out.at[indicator, 'latency'])
    print("[mora][EDP ] DLA: {:.4e}, RRAM: {:.4e}".format(dla_edp, rram_edp))
    return {'dla': dla_edp, 'rram': rram_edp}


def area(model, df, homepath, indicator=0):
    dla_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/[' + df + ']' + model + '_dla.csv'))
    rram_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/[' + df + ']' + model + '_rram.csv'))
    if os.path.exists(dla_output_csv_path) is not True or os.path.exists(dla_output_csv_path) is not True:
        print("api.read outfile conflict.")
        raise AttributeError
    dla_out = pd.read_csv(dla_output_csv_path)
    rram_out = pd.read_csv(rram_output_csv_path)
    dla_area = float(dla_out.at[indicator, 'area'])
    rram_area = float(rram_out.at[indicator, 'area'])
    print("[mora][area] DLA: {:.4e}, RRAM: {:.4e}".format(dla_area, rram_area))
    return {'dla': dla_area, 'rram': rram_area}


def check_mora_csv(homepath, model):
    model_path = os.path.abspath(os.path.join(homepath, 'model/' + model))
    model_csv_path = os.path.abspath(os.path.join(model_path, model + '_mora.csv'))
    model_df = pd.read_csv(model_csv_path)
    goodcsv = 1
    for idx, layer in model_df.iterrows():
        layertype = MLTD[layer['TYP']]
        if layertype == 'Linear':
            if layer['FS'] == 1 and layer['KS'] == 1 and layer['STR'] == 1 and layer['IDX'] < 0 and layer['APD'] >= 0:
                continue
        elif layertype == 'CONV':
            if layer['IDX'] < 0 and layer['APD'] <= 0:
                continue
        elif layertype == 'DWCONV':
            if layer['IC'] == layer['OC'] and layer['IDX'] < 0 and layer['APD'] == 0:
                continue
        elif layertype == 'Residual':
            if layer['OC'] == 1 and layer['KS'] == 1 and layer['STR'] == 1 and layer['IDX'] < 0 and layer['APD'] < 0:
                continue
        elif layertype == 'Batchnorm':
            if layer['KS'] == 1 and layer['STR'] == 1 and layer['IDX'] < 0 and layer['APD'] == 0:
                continue
        elif layertype == 'TRCONV' or layertype == 'NGCONV':
            if layer['APD'] > 0 and layer['IDX'] < 0:
                continue
        elif layertype == 'VDP' or layertype == 'VADD' or layertype == 'VMUL':
            if layer['IC'] == layer['OC'] and layer['FS'] == 1 and layer['KS'] == 1 and layer['STR'] == 1 and layer['IDX'] < 0 and layer['APD'] < 0:
                continue
        elif layertype == 'GEMM':
            if layer['KS'] == 1 and layer['STR'] == 1 and layer['IDX'] < 0 and layer['APD'] < 0:
                continue
        else:
            print("[mora][check csv] line {0} layer {1} [TYP] is wrong.".format(idx, layertype))
            goodcsv = 0
            continue
        print("[mora][check csv] line {0} layer {1} params are wrong.".format(idx, layertype))
        goodcsv = 0
    assert goodcsv == 1
    print("[mora][Check csv] {}_mora.csv file is right.".format(model))


def remove_csv_bn(homepath, model):
    # remove bn layer and reconstruct csv for 2 simulators
    model_path = os.path.abspath(os.path.join(homepath, 'model/' + model))
    model_csv_path = os.path.abspath(os.path.join(model_path, model + '_mora.csv'))
    model_csv_path_nobn = os.path.abspath(os.path.join(model_path, model + '.csv'))
    model_df = pd.read_csv(model_csv_path)
    # 1. refill ReLU pooling to previous layer  2. refill index to next layer
    for idx, layer in model_df.iterrows():
        if MLTD[layer['TYP']] == 'Batchnorm':
            assert layer['IDX'] == -1, "[mora][Remove BN] Batchnorm idx is not -1."
            assert model_df.at[idx + layer['IDX'], 'RP'] == 0, "[mora][Remove BN] ConvBNReLU, conv layer {0} RP is not 0.".format(idx + layer['IDX'])
            model_df.at[idx + layer['IDX'], 'RP'] = layer['RP']
            layer['RP'] = 0
    for idx, layer in model_df.iterrows():
        if layer['IDX'] != -1:
            for tmpidx in range(layer['IDX'] + 1, 0, 1):
                if MLTD[model_df.at[idx + tmpidx, 'TYP']] == 'Batchnorm':
                    layer['IDX'] += 1
                if model_df.at[idx + tmpidx, 'RP'] > 0:
                    layer['IDX'] -= 1 if model_df.at[idx + tmpidx, 'RP'] == 1 else 2
        if apd_is_index2(MLTD[layer['TYP']], layer['APD']):
            for tmpidx in range(layer['APD'] + 1, 0, 1):
                if MLTD[model_df.at[idx + tmpidx, 'TYP']] == 'Batchnorm':
                    layer['APD'] += 1
                if model_df.at[idx + tmpidx, 'RP'] > 0:
                    layer['APD'] -= 1 if model_df.at[idx + tmpidx, 'RP'] == 1 else 2
    model_df = model_df.drop(model_df[model_df['TYP'] == 4].index)
    model_df.to_csv(model_csv_path_nobn, index=False)
    print("[mora][Remove BN] csv bn layers removed.")
    return


def apd_is_index2(type, apd):
    return (type == 'CONV' or type == 'Residual' or type == 'VDP' or type == 'VADD' or type == 'VMUL' or type == 'GEMM') and (apd != 0)


def gemm(homepath, model, dataflow):
    # generate maestro model using maestro api
    model_path = os.path.abspath(os.path.join(homepath, 'model/' + model))
    maestro_model_csv_path = os.path.abspath(os.path.join(model_path, model + '.csv'))
    maestro_model_path = os.path.abspath(os.path.join(model_path, model + '_dla_model.m'))
    maestro_mapping_path = os.path.abspath(os.path.join(model_path, model + '_dla_' + dataflow + '.m'))

    # csv to maestro model
    model_ndarray = pd.read_csv(maestro_model_csv_path).to_numpy()
    model_layer_num = model_ndarray.shape[0]
    # 0IC 1OC 2FS 3KS 4STR 5TYP 6RP 7IDX 8APD
    with open(maestro_model_path, 'w') as fo:
        fo.write("Network {} {{\n".format(model))
        for line in range(model_layer_num):
            layer = model_ndarray[line, ...]
            assert MLTD[layer[5]] != 'Batchnorm'  # check bn
            KCRSYX = [layer[1], layer[0], layer[3], layer[3], layer[2], layer[2]]
            fo.write("Layer L{} {{\n".format(line))
            fo.write("Type: {} \n".format(MLTRD[MLTD[layer[5]]]))
            fo.write("Stride {{ X: {}, Y: {} }}\n".format(layer[4], layer[4]))
            if layer[5] == 6:  # NGCONV
                fo.write("Dimensions {{ G: {0}, K: {1[0]}, C: {1[1]}, R: {1[2]}, S: {1[3]}, Y: {1[4]}, X: {1[5]} }}\n".format(layer[8], KCRSYX))
            else:
                fo.write("Dimensions {{ K: {0[0]}, C: {0[1]}, R: {0[2]}, S: {0[3]}, Y: {0[4]}, X: {0[5]} }}\n".format(KCRSYX))
            fo.write("}\n")
        fo.write("}")
    print("[mora][GEMM] Done csv to maestro model.")

    # maestro model to meastro mapping model
    # ykp_os, yxp_os, kcp_ws, xp_ws, rs
    dpt_type_dict = {'ykp_os': '3', 'yxp_os': '3', 'kcp_ws': '1', 'xp_ws': '2', 'rs': '1'}
    df2 = copy.deepcopy(dataflow)
    if df2 == 'rs':
        df2 += '2'
    '''
    rs1_type_list = ['resnet', 'resnext', 'unet']
    rs2_type_list = []
    rs3_type_list = ['vgg16', 'vgg19']
    if dataflow == 'rs':
        if model in rs3_type_list:
            df2 += '3'
        else:
            for mod in rs1_type_list:
                if re.search(mod, model):
                    df2 += '1'
                    break
            if df2 == 'rs':
                df2 += '2'
    '''
    dataflow_path = os.path.abspath(os.path.join(homepath, 'maestro/tools/frontend/dataflow/' + df2 + '.m'))
    dpt_path = os.path.abspath(os.path.join(homepath, 'maestro/tools/frontend/dataflow/dpt' + dpt_type_dict[dataflow] + '.m'))

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
    print("[mora][GEMM] Done maestro model to mapping.")
    return


def gemmv2(model):
    # TODO: generate maestro model with using maestro orginal def
    return


def dse_checkpoint(indicator, EDP_cons, area_cons, model, df, homepath):
    # check csv result and save them
    edp_dse = EDP(model, df, homepath, indicator)
    area_dse = area(model, df, homepath, indicator)
    # ii = (edp_dse['dla'] > EDP_cons['dla'] * 0.75) & (edp_dse['rram'] > EDP_cons['rram'] * 0.75)
    # jj = (area_dse['dla'] > area_cons['dla'] * 0.75) & (area_dse['rram'] > area_cons['rram'] * 0.75)
    ii = (edp_dse['dla'] + edp_dse['rram']) > (EDP_cons['dla'] + EDP_cons['rram']) * 0.8
    jj = (area_dse['dla'] + area_dse['rram']) > (area_cons['dla'] + area_cons['rram']) * 0.8
    if edp_dse['dla'] == 0 or area_dse['dla'] == 0:
        DSE_checkpoint = False
    elif ii | jj:
        DSE_checkpoint = False
    else:
        DSE_checkpoint = True
    dla_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/[' + df + ']' + model + '_dla.csv'))
    rram_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/[' + df + ']' + model + '_rram.csv'))
    mora_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/[' + df + ']' + model + '_mora.csv'))
    dla_out_pd = pd.read_csv(dla_output_csv_path)
    rram_out_pd = pd.read_csv(rram_output_csv_path)
    assert dla_out_pd.at[indicator, 'restraint'] == 'unexamined'
    assert rram_out_pd.at[indicator, 'restraint'] == 'unexamined'
    # todo: add mora result
    rram_csv_dicts = {}
    rram_csv_dicts['DSE index'] = indicator
    rram_csv_dicts['DLA HW (pes, bw)'] = dla_out_pd.at[indicator, 'HW (pes, bw)']
    rram_csv_dicts['RRAM HW (tiles, bw)'] = rram_out_pd.at[indicator, 'HW (tiles, bw)']
    rram_csv_dicts['DLA layernum'] = dla_out_pd.at[indicator, 'layers']
    rram_csv_dicts['RRAM layernum'] = rram_out_pd.at[indicator, 'layers']
    rram_csv_dicts['DLA EDP'] = edp_dse['dla']
    rram_csv_dicts['RRAM EDP'] = edp_dse['rram']
    rram_csv_dicts['DLA area'] = area_dse['dla']
    rram_csv_dicts['DLA area'] = area_dse['dla']
    rram_csv_dicts['restraint'] = 'unexamined'

    if DSE_checkpoint is False:
        dla_out_pd.at[indicator, 'restraint'] = 'fail'
        rram_out_pd.at[indicator, 'restraint'] = 'fail'
        rram_csv_dicts['restraint'] = 'fail'
        print('[mora][DSE] checkpoint failed.')
    else:
        dla_out_pd.at[indicator, 'restraint'] = 'pass'
        rram_out_pd.at[indicator, 'restraint'] = 'pass'
        rram_csv_dicts['restraint'] = 'pass'
        print('[mora][DSE] checkpoint passed.')
    dla_out_pd.to_csv(dla_output_csv_path, index=False)
    rram_out_pd.to_csv(rram_output_csv_path, index=False)
    mora_csv = pd.DataFrame(rram_csv_dicts, index=[indicator])
    if os.path.exists(mora_output_csv_path):
        mora_csv.to_csv(mora_output_csv_path, mode='a', header=False, index=False)
    else:
        mora_csv.to_csv(mora_output_csv_path, index=False)
    return


def summary(homepath, **kwargs):
    result_path = os.path.abspath(os.path.join(homepath, 'output/' + kwargs['model'] + '/result'))
    dataflow_list = ['kcp_ws', 'yxp_os', 'xp_ws', 'rs', 'ykp_ws']
    for df in dataflow_list:
        result_csv_path = os.path.abspath(os.path.join(result_path, '[' + df + ']' + kwargs['model'] + '_mora.csv'))
        mora_result = pd.read_csv(result_csv_path)
    return
