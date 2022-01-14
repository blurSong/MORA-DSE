#!/bin/bash
AN="alexnet"
VG16="vgg16"
VG19="vgg19"
RN18="resnet18"
RN34="resnet34"
RN50="resnet50"
RXN50="resnext50"
MN="mobilenet_v2"
SN="shufflenet_v2"
UN="unet"

DATAFLOW="kcp_ws"

echo "start dse cloudy"
python mora.py --scenario edge --dataflow $DATAFLOW --model $VG16
wait
python mora.py --scenario edge --dataflow $DATAFLOW --model $VG19
wait
python mora.py --scenario edge --dataflow $DATAFLOW --model $RN50
wait
python mora.py --scenario edge --dataflow $DATAFLOW --model $RXN50
wait

