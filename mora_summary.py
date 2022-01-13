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
    parser.add_argument('--model', type=str, default='all')
    args = parser.parse_args()
    homepath = os.path.dirname(__file__)
    for model in ['alexnet', 'vgg16', 'vgg19', 'resnet18', 'resnet34', 'resnet50', 'resnext50', 'mobilenet_v2', 'shufflenet_v2']:
        if model == args.model or args.model == 'all':
            mora.api.summary(homepath, model)
            print('[mora][summary] {} summed.'.format(model))
    print('[mora][summary] Finish.')
