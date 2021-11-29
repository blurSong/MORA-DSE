import os
import re
import sys
import numpy as np
import pandas as pd
# from mod2map import mod2map

maestro_layer_type_ref_dicts = {
    "Linear": "CONV",
    "CONV": "CONV",
    "DWCONV": "DSCONV",
    "Residual": "DSCONV",
    "TRCONV": "TRCONV",
    "NGCONV": "NGCONV",
    "VDP": "CONV",
    "VADD": "DSCONV"
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
    8: "VADD"
}  # DWCONV is DSCONV for maestro
mora_layer_param_dicts = {
    'IC': 'input_channel',
    'OC': 'output_channel',
    'FS': 'feature_size',
    'KS': 'kernel_size',
    'STR': 'stride',
    'TYP': 'layer_type',
    'RP': 'relu_or_relu&pooling',
    'APD': 'appending_index',
}
# ====================================== mora ====================================================================
# model csv name: model_mora.csv
# 1. define the layer type TYP using mora_layer_type_dicts
#
# 2. HOW TO FILL PARAMS [IC OC FS KS STR]
#           CONV : fill all
#           Linear  : fill IC OC, keep FS KS STR = 1
#           DWCONV  : fill all (Do make sure IC = OC)
#           Residual : fill IC FS, keep KS OC STR = 1 (OC must be 1 for maestro)
#                      (Do note that res layers wonnt be shown in pytorch print models）
#           Batchnorm ： fill IC OC FS, keep KS STR =1 (Do make sure IC = OC)
#           PWCONV : use 1x1 CONV
#           TRCONV / NGCONV : TODO
# 3. HOW TO FILL RP AND APD
#           RP
#                   0 : no relu OR not conv linear layers
#                   1 : relu but no pooling
#                   2 and above : relu and pooling, fill the pooling kernel size
#           APD
#                   for residual layer ： residual input index (one is -1， the other is the pre layer index) for MNSIM
#                   for fc layer ： whether it is the first fc layer （yes=1， no=0） for MNSIM
#                   for other layers : default 0
# 4. leave all other param blanks ： 0 or NaN
# ==================================================================================================================

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


def remove_csv_bn(homepath, model):
    model_path = os.path.abspath(os.path.join(homepath, 'model/' + model))
    model_csv_path = os.path.abspath(os.path.join(model_path, model + '_mora.csv'))
    model_csv_path_nobn = os.path.abspath(os.path.join(model_path, model + '.csv'))
    model_df = pd.read_csv(model_csv_path)
    model_df = model_df.drop(model_df[model_df['TYP'] == 4].index)
    model_df.to_csv(model_csv_path_nobn)
    return


def gemm(homepath, model, dataflow):
    # generate maestro model using maestro api
    model_path = os.path.abspath(os.path.join(homepath, 'model/' + model))
    maestro_model_csv_path = os.path.abspath(os.path.join(model_path, model + '.csv'))
    maestro_model_path = os.path.abspath(os.path.join(model_path, model + '_dla_model.m'))
    maestro_mapping_path = os.path.abspath(os.path.join(model_path, model + '_dla_' + dataflow + '.m'))

    # csv to maestro model
    model_ndarray = pd.read_csv(maestro_model_csv_path).to_numpy()
    model_layer_num = model_ndarray.shape[0]
    with open(maestro_model_path, 'w') as fo:
        fo.write("Network {} {{\n".format(model))
        for line in range(model_layer_num):
            layer = model_ndarray[line, ...]
            assert layer[5] != 4  # check bn at gemm
            KCRSYX = [layer[1], layer[0], layer[3], layer[3], layer[2], layer[2]]
            fo.write("Layer L{} {{\n".format(line))
            fo.write("Type: {} \n".format(MLTRD[MLTD[layer[5]]]))
            fo.write("Stride {{ X: {}, Y: {} }}\n".format(layer[4], layer[4]))
            fo.write("Dimensions {{ K: {0[0]}, C: {0[1]}, R: {0[2]}, S: {0[3]}, Y: {0[4]}, X: {0[5]} }}\n".format(KCRSYX))
            fo.write("}\n")
        fo.write("}")
    print("[mora][gemm] done csv to maestro model.")

    # maestro model to meastro mapping model
    # ykp_os, yxp_os, kcp_ws, xp_ws, rs
    dpt_type_dict = {'ykp_os': '3', 'yxp_os': '3', 'kcp_ws': '1', 'xp_ws': '2', 'rs': '1'}
    rs1_type_list = ['resnet', 'resnext', 'unet', 'vgg']
    df2 = dataflow
    if df2 == 'rs':
        for mod in rs1_type_list:
            if re.search(mod, model):
                df2 += '1'
                break
    if df2 == 'rs':
        df2 += '2'
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
    print("[mora][gemm] done maestro model to mapping.")
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
    ii = (edp_dse['dla'] + edp_dse['rram']) > (EDP_cons['dla'] + EDP_cons['rram']) * 0.75
    jj = (area_dse['dla'] + area_dse['rram']) > (area_cons['dla'] + area_cons['rram']) * 0.75
    if edp_dse['dla'] == 0 or area_dse['dla'] == 0:
        DSE_checkpoint = False
    elif ii | jj:
        DSE_checkpoint = False
    else:
        DSE_checkpoint = True
    dla_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/[' + df + ']' + model + '_dla.csv'))
    rram_output_csv_path = os.path.abspath(os.path.join(homepath, 'output/' + model + '/[' + df + ']' + model + '_rram.csv'))
    dla_out_pd = pd.read_csv(dla_output_csv_path)
    rram_out_pd = pd.read_csv(rram_output_csv_path)
    assert dla_out_pd.at[indicator, 'restraint'] == 'unexamined'
    assert rram_out_pd.at[indicator, 'restraint'] == 'unexamined'
    if DSE_checkpoint is False:
        dla_out_pd.at[indicator, 'restraint'] = 'fail'
        rram_out_pd.at[indicator, 'restraint'] = 'fail'
        print('dse checkpoint failed.')
    else:
        dla_out_pd.at[indicator, 'restraint'] = 'pass'
        rram_out_pd.at[indicator, 'restraint'] = 'pass'
        print('dse checkpoint passed.')
    dla_out_pd.to_csv(dla_output_csv_path, index=False)
    rram_out_pd.to_csv(rram_output_csv_path, index=False)
    return
