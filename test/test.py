import torch
from torchvision import models, transforms, datasets
import os
import sys
# sys.path.append('D:\\AIR\\Net')
sys.path.append(os.path.dirname(__file__))
from torchsummary import summary

resnet18 = models.resnet18(pretrained=True)
resnet50 = models.resnet50(pretrained=True)
alexnet = models.alexnet(pretrained=True)
vgg16 = models.vgg16(pretrained=True)
squeezenet = models.squeezenet1_0(pretrained=True)
densenet = models.densenet161(pretrained=True)
inception = models.inception_v3(pretrained=True)
googlenet = models.googlenet(pretrained=True)
shufflenet = models.shufflenet_v2_x1_0(pretrained=True)
mobilenet_v2 = models.mobilenet_v2(pretrained=True)
resnext50_32x4d = models.resnext50_32x4d(pretrained=True)
wide_resnet50_2 = models.wide_resnet50_2(pretrained=True)
mnasnet = models.mnasnet1_0(pretrained=True)

model = resnet18
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
if device == 'cuda':
    model = model.to(device)
    model = torch.nn.DataParallel(model)

summary(model, (3, 224, 224))
print(model)
'''
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
if device == 'cuda':
    model = vgg16.to(device)
    model = torch.nn.DataParallel(model)
trans = []
trans.append(transforms.Resize(size=224))
trans.append(transforms.ToTensor())
trans.append(transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225]))
cifar10_224 = datasets.CIFAR10(root=os.path.dirname(__file__), train=False, download=True, transform=trans)
tester = torch.utils.data.DataLoader(cifar10_224, batch_size=8, shuffle=True, num_workers=4)
'''
