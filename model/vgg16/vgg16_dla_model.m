Network vgg16 {
Layer L0 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 3, R: 3, S: 3, Y: 224, X: 224 }
}
Layer L1 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 224, X: 224 }
}
Layer L2 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 64, R: 3, S: 3, Y: 112, X: 112 }
}
Layer L3 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 112, X: 112 }
}
Layer L4 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 128, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L5 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L6 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L7 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 256, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L8 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L9 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L10 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L11 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L12 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L13 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 4096, C: 2048, R: 1, S: 1, Y: 1, X: 1 }
}
Layer L14 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 4096, C: 4096, R: 1, S: 1, Y: 1, X: 1 }
}
Layer L15 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1000, C: 4096, R: 1, S: 1, Y: 1, X: 1 }
}
}