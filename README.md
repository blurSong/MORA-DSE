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
3. provid original DNN .csv file on the /model folder
```
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

```
```
mora_layer_type_dicts = {0: "Linear", 1: "CONV", 2: "DWCONV", 3: "Residual", 4: "TRCONV", 5: "NGCONV"}  # DWCONV Residual is DSCONV on maestro
```
4. Edit the hw_config.m to init the DSE
5. Add the workspace folder to PYTHONPATH and run mora
```
export PYTHONPATH=$PYTHONPATH:$MoraPath
python mora.py --dataflow dataflow_name --model model_name
```