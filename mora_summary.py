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
    parser.add_argument('--model', type=str, default='resnet18')
    args = parser.parse_args()
    homepath = os.path.dirname(__file__)
    mora.api.summary(homepath, args.model)
    print('[mora][summary] Summed.')
