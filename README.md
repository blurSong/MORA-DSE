# Mora
  A heterogeneous simulator for availability investigation of RRAM accelerators.
  
  MNSIM forked from https://github.com/Zhu-Zhenhua/MNSIM_Python
  
  maestro forked from https://github.com/maestro-project/maestro


## build
1. clone the repositories.  
```
git clone https://github.com/blurSong/Mora.git
```
2. build maestro following http://maestro.ece.gatech.edu/docs/build/html/getting_started.html
```
cd maestro
scons
```
3. provide original DNN .csv file on the /model folder, the csv index and DF value should be like: 
   
```
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
# ====================================== mora ====================================================================
# 0. model csv name: model_mora.csv
#
# 1. define the layer type TYP using mora_layer_type_dicts
#
# 2. HOW TO FILL PARAMS [IC OC FS KS STR]
#           CONV : fill all
#           Linear  : fill IC OC, keep FS KS STR = 1
#           DWCONV  : fill all (Do make sure IC = OC)
#           Residual : fill IC FS, keep KS OC STR = 1 (OC must be 1 for maestro)
#                      (Do note that res layers wonnt be shown in pytorch print models)
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
#                   for fc layer ： whether it is the first fc layer (yes=1， no=0) for MNSIM
#                   for other layers : default 0
# 4. leave all other param blanks ： 0 or NaN
# ==================================================================================================================

```
```
scenario = {embedded, edge, cloud}
```
4. Edit the hw_config.m to init the DSE
5. Add the workspace folder to PYTHONPATH and run mora
```
export PYTHONPATH=$PYTHONPATH:$MORAPATH
python mora.py --dataflow DATAFLOW --model MODEL --scenario SCENARIO
```
