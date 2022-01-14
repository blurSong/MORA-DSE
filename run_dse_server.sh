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

echo "start dse locally"
python mora.py --scenario edge --dataflow kcp_ws --model $VG16
wait
python mora.py --scenario edge --dataflow kcp_ws --model $VG19
wait
python mora.py --scenario edge --dataflow kcp_ws --model $RN50
wait
python mora.py --scenario edge --dataflow kcp_ws --model $RXN50
wait
python mora.py --scenario edge --dataflow kcp_ws --model $MN
wait

