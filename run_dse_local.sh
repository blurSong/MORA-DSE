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

DATAFLOW="xp_ws"

echo "Start dse locally" & echo $DATAFLOW
echo $AN
python mora.py --scenario edge --dataflow $DATAFLOW --model $AN
wait
echo $RN18
python mora.py --scenario edge --dataflow $DATAFLOW --model $RN18
wait
echo $RN34
python mora.py --scenario edge --dataflow $DATAFLOW --model $RN34
wait
echo $MN
python mora.py --scenario edge --dataflow $DATAFLOW --model $MN
wait
echo $SN
python mora.py --scenario edge --dataflow $DATAFLOW --model $SN
wait



