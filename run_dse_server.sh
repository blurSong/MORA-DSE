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

DATAFLOW1="xp_ws"

echo "Start dse cloudy" & echo $DATAFLOW1
echo $VG16
python mora.py --scenario edge --dataflow $DATAFLOW1 --model $VG16
wait
echo $VG19
python mora.py --scenario edge --dataflow $DATAFLOW1 --model $VG19
wait
echo $RN50
python mora.py --scenario edge --dataflow $DATAFLOW1 --model $RN50
wait
echo $RXN50
python mora.py --scenario edge --dataflow $DATAFLOW1 --model $RXN50
wait


DATAFLOW2="rs"

echo "Start dse cloudy" & echo $DATAFLOW2
echo $VG16
python mora.py --scenario edge --dataflow $DATAFLOW2 --model $VG16
wait
echo $VG19
python mora.py --scenario edge --dataflow $DATAFLOW2 --model $VG19
wait
echo $RN50
python mora.py --scenario edge --dataflow $DATAFLOW2 --model $RN50
wait
echo $RXN50
python mora.py --scenario edge --dataflow $DATAFLOW2 --model $RXN50
wait

DATAFLOW3="yxp_os"

echo "Start dse cloudy" & echo $DATAFLOW3
echo $VG16
python mora.py --scenario edge --dataflow $DATAFLOW3 --model $VG16
wait
echo $VG19
python mora.py --scenario edge --dataflow $DATAFLOW3 --model $VG19
wait
echo $RN50
python mora.py --scenario edge --dataflow $DATAFLOW3 --model $RN50
wait
echo $RXN50
python mora.py --scenario edge --dataflow $DATAFLOW3 --model $RXN50
wait