Network resnet18 {
Layer L0 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 64, C: 3, R: 7, S: 7, Y: 224, X: 224 }
}
Layer L1 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L2 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L3 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 64, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L4 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L5 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L6 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 64, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L7 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 128, C: 64, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L8 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L9 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 128, C: 64, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L10 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 128, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L11 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L12 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L13 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 128, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L14 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 256, C: 128, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L15 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L16 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 256, C: 128, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L17 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L18 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L19 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L20 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L21 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 512, C: 256, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L22 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L23 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 512, C: 256, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L24 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L25 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L26 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L27 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L28 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1000, C: 512, R: 1, S: 1, Y: 1, X: 1 }
}
}