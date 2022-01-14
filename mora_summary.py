from calendar import c
import copy
import os
import sys
import argparse
import subprocess as SP
import torch
import MNSIM
import mora
import math

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='mora summary parser')
    rules = ['dlaperf', 'normperf', 'totalperf']
    models = ['alexnet', 'vgg16', 'vgg19', 'resnet18', 'resnet34', 'resnet50', 'resnext50', 'mobilenet_v2', 'shufflenet_v2']
    parser.add_argument('--model', type=str, default='all')
    parser.add_argument('--rule', type=str, default='dlaperf', choices=rules)
    args = parser.parse_args()
    homepath = os.path.dirname(__file__)
    for mod in models:
        if mod == args.model or args.model == 'all':
            mora.api.summary(homepath, mod, args.rule)
            print('[mora][summary] {} summed.'.format(mod))
    print('[mora][summary] Finish.')
