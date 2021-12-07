#
# modified by blurSong 12.7 for real RRAM memcap calculation

import torch
import torch.nn as nn
from torch.autograd import Variable
import math

from collections import OrderedDict
import numpy as np


def summary(model, input_size, batch_size=1, device="cuda"):
    xbar_size = 128

    def register_hook(module):
        def hook(module, input, output):
            class_name = str(module.__class__).split(".")[-1].split("'")[0]
            module_idx = len(summary)

            m_key = "%s-%i" % (class_name, module_idx + 1)
            summary[m_key] = OrderedDict()
            summary[m_key]["input_shape"] = list(input[0].size())
            summary[m_key]["input_shape"][0] = batch_size
            if isinstance(output, (list, tuple)):
                summary[m_key]["output_shape"] = [[-1] + list(o.size())[1:] for o in output]
            else:
                summary[m_key]["output_shape"] = list(output.size())
                summary[m_key]["output_shape"][0] = batch_size

            params = 0
            rram_xbars = 0  # rram xbars used of this layer
            if hasattr(module, "weight") and hasattr(module.weight, "size"):
                params += torch.prod(torch.LongTensor(list(module.weight.size())))
                summary[m_key]["trainable"] = module.weight.requires_grad
                # mora
                if isinstance(module, nn.Conv2d):
                    # if module.groups == 1:
                    xbar_hori_f = module.kernel_size[0] * module.kernel_size[1] * module.in_channels * 1.0 / xbar_size
                    xbar_vert_f = module.out_channels * (16 / 2) / (xbar_size - 1.0)
                    rram_xbars = math.ceil(xbar_hori_f) * round(xbar_vert_f)
                elif isinstance(module, nn.Linear):
                    rram_xbars = math.ceil(module.in_features * 1.0 / xbar_size) * round(module.out_features * (16 / 2) / (xbar_size - 1.0))
            if hasattr(module, "bias") and hasattr(module.bias, "size"):
                params += torch.prod(torch.LongTensor(list(module.bias.size())))
            summary[m_key]["nb_params"] = params
            summary[m_key]["xbars"] = rram_xbars

        if (not isinstance(module, nn.Sequential) and not isinstance(module, nn.ModuleList) and not (module == model)):
            hooks.append(module.register_forward_hook(hook))

    device = device.lower()
    assert device in [
        "cuda",
        "cpu",
    ], "Input device is not valid, please specify 'cuda' or 'cpu'"

    if device == "cuda" and torch.cuda.is_available():
        # dtype = torch.cuda.FloatTensor
        dtype = torch.FloatTensor
    else:
        dtype = torch.FloatTensor

    # multiple inputs to the network
    if isinstance(input_size, tuple):
        input_size = [input_size]

    # batch_size of 2 for batchnorm
    x = [torch.rand(2, *in_size).type(dtype) for in_size in input_size]
    # print(type(x[0]))

    # create properties
    summary = OrderedDict()
    hooks = []

    # register hook
    model.apply(register_hook)

    # make a forward pass
    # print(x.shape)
    model(*x)

    # remove these hooks
    for h in hooks:
        h.remove()

    print("----------------------------------------------------------------")
    line_new = "{:>20} {:>25} {:>15} {:>10}".format("Layer (type)", "Input Shape", "Param #", "Xbar #")
    print(line_new)
    print("================================================================")
    total_params = 0
    total_output = 0
    total_xbars = 0
    trainable_params = 0
    for layer in summary:
        # input_shape, output_shape, trainable, nb_params, xbars
        line_new = "{:>20} {:>25} {:>15} {:>10}".format(
            layer,
            str(summary[layer]["input_shape"]),
            "{0:,}".format(summary[layer]["nb_params"]),
            "{0:,}".format(summary[layer]["xbars"]),
        )
        total_xbars += summary[layer]["xbars"]
        total_params += summary[layer]["nb_params"]
        total_output += np.prod(summary[layer]["output_shape"])
        if "trainable" in summary[layer]:
            if summary[layer]["trainable"] == True:
                trainable_params += summary[layer]["nb_params"]
        print(line_new)

    # assume 4 bytes/number (float on cuda).
    total_input_size = abs(np.prod(input_size) * batch_size * 4. / (1024**2.))
    total_output_size = abs(2. * total_output * 4. / (1024**2.))  # x2 for gradients
    total_params_size = abs(total_params.numpy() * 4. / (1024**2.))
    total_size = total_params_size + total_output_size + total_input_size

    # mora int16
    total_memcap = total_xbars * 128**2 * 2.0 / (1024 * 1024)
    total_pes = total_xbars / 8
    total_tiles = total_pes / 12

    print("================================================================")
    print("Total params: {0:,}".format(total_params))
    print("Trainable params: {0:,}".format(trainable_params))
    print("Non-trainable params: {0:,}".format(total_params - trainable_params))
    print("----------------------------------------------------------------")
    print("Input size fp32 (MB): %0.2f" % total_input_size)
    print("Forward/backward pass size (MB): %0.2f" % total_output_size)
    print("Params size fp32 (MB): %0.2f" % total_params_size)
    print("Estimated Total Size fp32 (MB): %0.2f" % total_size)
    print("----------------------------------------------------------------")
    print("Total RRAM MemCaps int16 (MB) : %0.2f" % total_memcap)
    print("Total Xbars: ", int(total_xbars))
    print("Total RRAM PEs :", int(total_pes))
    print("Total RRAM Tiles :", int(total_tiles))
    print("----------------------------------------------------------------")

    return
