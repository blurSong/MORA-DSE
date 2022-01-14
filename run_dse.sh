#!/bin/zsh
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
python mora.py --scenario edge --dataflow kcp_ws --model $AN
wait
python mora.py --scenario edge --dataflow kcp_ws --model $RN18
wait
python mora.py --scenario edge --dataflow kcp_ws --model $RN34
wait
python mora.py --scenario edge --dataflow kcp_ws --model $AN
wait
python mora.py --scenario edge --dataflow kcp_ws --model $SN
wait



