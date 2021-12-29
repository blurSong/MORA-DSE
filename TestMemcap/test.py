import torch
from torchvision import models, transforms, datasets
import os
import sys
from torchsummary import summary

sys.path.append(os.path.dirname(__file__))

resnet18 = models.resnet18(pretrained=False)
resnet50 = models.resnet50(pretrained=False)
resnet152 = models.resnet152(pretrained=False)
alexnet = models.alexnet(pretrained=False)
vgg16 = models.vgg16_bn(pretrained=False, num_classes=10)
vgg19 = models.vgg19_bn(pretrained=False)
squeezenet = models.squeezenet1_0(pretrained=False)
densenet = models.densenet161(pretrained=False)
inception = models.inception_v3(pretrained=False)
googlenet = models.googlenet(pretrained=False)
shufflenet = models.shufflenet_v2_x1_0(pretrained=False)
mobilenet_v2 = models.mobilenet_v2(pretrained=False)
resnext50_32x4d = models.resnext50_32x4d(pretrained=False)
wide_resnet50_2 = models.wide_resnet50_2(pretrained=False)
mnasnet = models.mnasnet1_0(pretrained=False)

model = mobilenet_v2
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
if device == 'cuda':
    model = model.to(device)
    model = torch.nn.DataParallel(model)

summary(model, (3, 224, 224))
print(model)
'''
trans = []
trans.append(transforms.Resize(size=224))
trans.append(transforms.ToTensor())
trans.append(transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225]))
cifar10_224 = datasets.CIFAR10(root=os.path.dirname(__file__), train=False, download=True, transform=trans)
tester = torch.utils.data.DataLoader(cifar10_224, batch_size=8, shuffle=True, num_workers=4)
'''
