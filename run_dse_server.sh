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

DATAFLOW1="rs"
DATAFLOW2="kcp_ws"
DATAFLOW3="xp_ws"
DATAFLOW4="yxp_os"
DATAFLOW5="ykp_os"

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
echo $SN
python mora.py --scenario edge --dataflow $DATAFLOW1 --model $SN
wait


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
echo $SN
python mora.py --scenario edge --dataflow $DATAFLOW2 --model $SN
wait


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
echo $SN
python mora.py --scenario edge --dataflow $DATAFLOW3 --model $SN
wait


echo "Start dse cloudy" & echo $DATAFLOW4
echo $VG16
python mora.py --scenario edge --dataflow $DATAFLOW4 --model $VG16
wait
echo $VG19
python mora.py --scenario edge --dataflow $DATAFLOW4 --model $VG19
wait
echo $RN50
python mora.py --scenario edge --dataflow $DATAFLOW4 --model $RN50
wait
echo $RXN50
python mora.py --scenario edge --dataflow $DATAFLOW4 --model $RXN50
wait
echo $SN
python mora.py --scenario edge --dataflow $DATAFLOW4 --model $SN
wait


echo "Start dse cloudy" & echo $DATAFLOW5
echo $VG16
python mora.py --scenario edge --dataflow $DATAFLOW5 --model $VG16
wait
echo $VG19
python mora.py --scenario edge --dataflow $DATAFLOW5 --model $VG19
wait
echo $RN50
python mora.py --scenario edge --dataflow $DATAFLOW5 --model $RN50
wait
echo $RXN50
python mora.py --scenario edge --dataflow $DATAFLOW5 --model $RXN50
wait
echo $SN
python mora.py --scenario edge --dataflow $DATAFLOW5 --model $SN
wait