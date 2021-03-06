# How to generate a mapping (Maestro input file)
A mapping is a Maestro input file which contains a DNN model and the dataflow for each layer.

This tutorial is written to provide an easy way to generate a mapping from a PyTorch/Keras model.

1. Generate a Maestro DNN Model file from a Pytorch/Keras model.
2. Generate a Maestro Mapping file with the Maestro DNN Model file and specific dataflow.
3. Run Maestro with the generated mapping.

For the syntax of the mapping file, please refer to example mapping files in data/mapping.

Supported pre-trained models are provided in the following links:

<ul>
  <li> PyTorch: [torchvision.models](https://pytorch.org/docs/stable/torchvision/models.html) </li>
  <li> Keras: [tensorflow.keras.applications](https://www.tensorflow.org/api_docs/python/tf/keras/applications) 
  
  *tensorflow 2.0 should be installed.* </li>
</ul>

## 1. Generate a Maestro DNN Model file from a Pytorch/Keras model.
> cd tools/frontend

Check the messages from the help for the future reference.
> python frameworks_to_modelfile_maestro.py --help

> python frameworks_to_modelfile_maestro.py --api_name pytorch --input_size 3,224,224 --model mobilenet_v2 --outfile dnn_model.m 
```
--api_name: the API name, choose from "pytorch, keras"

--input_size: the input image size of the first layer

--model: the model name from torchvision.models (or tensorflow.keras.applications)
         TO use a custom model, enter custom for this argument.

--custom: Enter the custom network python file name here. 
          The file should have a function whose name is same as the file name and returns the model.
          (This option is working only for keras now)
          
--outfile: the MAESTRO model output file name
```
The Maestro DNN Model, dnn_model.m, will be generated in ../../data/model:

## 2. Generate a Maestro Mapping file with the Maestro DNN Model file and specific dataflow.
Check the messages from the help for the future reference.
> python modelfile_to_mapping.py --help

> python modelfile_to_mapping.py --model_file dnn_model.m --dataflow os --outfile out.m 
```
--model_file: The model file supported by maestro as specified by the user or generated by the above given script.

--dataflow: the dataflow for each layer, choose from "os, ws, rs, dla"
          
--outfile: the MAESTRO DFSL output file
```

The mapping file, out.m, will be generated in ../../data/mapping:

## 3. Run Maestro with the generated mapping.

Go back to the maestro-dev directory.

> cd ../../

Change the contents of "run_example.sh" to use the mapping file generated.

--DFSL_file='data/mapping/out.m'

Run MAESTRO

> ./run_example.sh
