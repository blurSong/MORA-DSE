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

DATAFLOW1="rs"
DATAFLOW2="kcp_ws"
DATAFLOW3="xp_ws"
DATAFLOW4="yxp_os"
DATAFLOW5="ykp_os"

echo "[mora] Start dse locally " & echo $DATAFLOW1
echo $AN
python mora.py --scenario edge --dataflow $DATAFLOW1 --model $AN
wait
echo $RN18
python mora.py --scenario edge --dataflow $DATAFLOW1 --model $RN18
wait
echo $RN34
python mora.py --scenario edge --dataflow $DATAFLOW1 --model $RN34
wait
echo $MN
python mora.py --scenario edge --dataflow $DATAFLOW1 --model $MN
wait


echo "[mora] Start dse locally " & echo $DATAFLOW2
echo $AN
python mora.py --scenario edge --dataflow $DATAFLOW2 --model $AN
wait
echo $RN18
python mora.py --scenario edge --dataflow $DATAFLOW2 --model $RN18
wait
echo $RN34
python mora.py --scenario edge --dataflow $DATAFLOW2 --model $RN34
wait
echo $MN
python mora.py --scenario edge --dataflow $DATAFLOW2 --model $MN
wait


echo "[mora] Start dse locally " & echo $DATAFLOW3
echo $AN
python mora.py --scenario edge --dataflow $DATAFLOW3 --model $AN
wait
echo $RN18
python mora.py --scenario edge --dataflow $DATAFLOW3 --model $RN18
wait
echo $RN34
python mora.py --scenario edge --dataflow $DATAFLOW3 --model $RN34
wait
echo $MN
python mora.py --scenario edge --dataflow $DATAFLOW3 --model $MN
wait


echo "[mora] Start dse locally " & echo $DATAFLOW4
echo $AN
python mora.py --scenario edge --dataflow $DATAFLOW4 --model $AN
wait
echo $RN18
python mora.py --scenario edge --dataflow $DATAFLOW4 --model $RN18
wait
echo $RN34
python mora.py --scenario edge --dataflow $DATAFLOW4 --model $RN34
wait
echo $MN
python mora.py --scenario edge --dataflow $DATAFLOW4 --model $MN
wait


echo "[mora] Start dse locally " & echo $DATAFLOW5
echo $AN
python mora.py --scenario edge --dataflow $DATAFLOW5 --model $AN
wait
echo $RN18
python mora.py --scenario edge --dataflow $DATAFLOW5 --model $RN18
wait
echo $RN34
python mora.py --scenario edge --dataflow $DATAFLOW5 --model $RN34
wait
echo $MN
python mora.py --scenario edge --dataflow $DATAFLOW5 --model $MN
wait
