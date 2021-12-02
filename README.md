# Mora
  A heterogeneous simulator for availability investigation of RRAM accelerators.
  
  MNSIM forked from https://github.com/Zhu-Zhenhua/MNSIM_Python
  
  maestro forked from https://github.com/maestro-project/maestro


## run DSE
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
    'IDX': 'input index',
    'APD': 'appending',
}
mora_layer_type_dicts = {
    0: "Linear",        # MVM, FC
    1: "CONV",          # convolution
    2: "DWCONV",        # deepwise convolution
    3: "Residual",
    4: "Batchnorm",
    5: "TRCONV",        # transposed convolution
    6: "NGCONV",        # group convolution
    7: "VDP",
    8: "VADD",
    9: "VMUL"
    10: "GEMM" 
}  # DWCONV is DSCONV for maestro
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
##  How to define model csv

0. Model csv name: **model_mora.csv**

1. Define the layer type **TYP** using **mora_layer_type_dicts**

2. How to fill **[IC OC FS KS STR]**  
    **Linear**  : fill IC OC, keep FS KS STR = 1  
    **CONV**: fill all  
    **DWCONV**  : fill all (Do make sure IC = OC)  
   **Residual** : fill IC FS, keep KS OC STR = 1 (OC must be 1 for maestro)
            (Do note that res layers wonnt be shown in pytorch print models)  
    **Batchnorm** ： fill IC OC FS, keep KS STR =1 (Do make sure IC = OC)   
    **PWCONV** : use 1x1 CONV  
    **TRCONV** : fill all  
    **NGCONV** :  fill all  
3. How to fill **[RP] [IDX] [APD]**  
          **[RP]**  
                   0 : **this layer**  has no relu next  
                   1 : **this layer**  has relu but no pooling next  
                   2 and above : **this layer has**  relu and pooling next, fill in the pooling kernel size    
          **[IDX]**      
                   default and usually -1, i.e. the previous layer. the index is **just the layer order in our csv**  
                   for multi-input layers (concat conv, residual, batchnorm, VDP, VADD, GEMM, etc), fill one index in **IDX**, the other in **APD**  
          **[APD]**  
                  linear ： whether it is the first fc layer (yes=1， no=0) 
                  multi-input layers (concat conv, residual, VDP, VADD, VMUL, GEMM, etc): input index 2  
                  TRCONV : dilation  
                  NGCONV : group number  
                  others : default 0  
4. All default blanks could be ： default value or NaN(blank)

| base layer    | IC  | OC  | FS  | KS  | STR | RP  | IDX | APD                                                  | Note               |
| ------------- | --- | --- | --- | --- | --- | --- | --- | ---------------------------------------------------- | ------------------ |
| Linear  [0]   | IC  | OC  | 1   | 1   | 1   | RP  | IDX | 1 (is first fc layer) <br> 0 (is not first fc layer) |                    |
| CONV    [1]   | IC  | OC  | FS  | KS  | STR | RP  | IDX | 0 (default) <br> -x (input index 2 for concat)       |                    |
| DWCONV [2]    | IC  | OC  | FS  | KS  | STR | RP  | IDX | 0                                                    | IC = OC            |
| Residual [3]  | IC  | 1   | FS  | 1   | 1   | 0   | IDX | input index 2                                        | OC = 1 for maestro |
| Batchnorm [4] | IC  | OC  | FS  | 1   | 1   | RP  | IDX | 0                                                    |                    |
| TRCONV [5]    | IC  | OC  | FS  | KS  | STR | RP  | IDX | dilation                                             |                    |
| NGCONV [6]    | IC  | OC  | FS  | KS  | STR | RP  | IDX | group number                                         |                    |
| VDP [7]       | IC  | OC  | 1   | 1   | 1   | RP  | IDX | input index 2                                        | IC = OC            |
| VADD [8]      | IC  | OC  | 1   | 1   | 1   | RP  | IDX | input index 2                                        | IC = OC            |
| VMUL [9]      | IC  | OC  | 1   | 1   | 1   | RP  | IDX | input index 2                                        | IC = OC            |
| GEMM [10]     | M   | N   | K   | 1   | 1   | RP  | IDX | input index 2                                        | MK * KN            |


## LINK
