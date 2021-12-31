Network mobilenet_v2 {
Layer L0 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 32, C: 3, R: 3, S: 3, Y: 224, X: 224 }
}
Layer L1 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 32, C: 32, R: 3, S: 3, Y: 112, X: 112 }
}
Layer L2 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 16, C: 32, R: 1, S: 1, Y: 112, X: 112 }
}
Layer L3 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 96, C: 16, R: 1, S: 1, Y: 112, X: 112 }
}
Layer L4 {
Type: DSCONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 96, C: 96, R: 3, S: 3, Y: 112, X: 112 }
}
Layer L5 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 24, C: 96, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L6 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 144, C: 24, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L7 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 144, C: 144, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L8 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 24, C: 144, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L9 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 24, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L10 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 144, C: 24, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L11 {
Type: DSCONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 144, C: 144, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L12 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 32, C: 144, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L13 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 192, C: 32, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L14 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 192, C: 192, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L15 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 32, C: 192, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L16 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 32, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L17 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 192, C: 32, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L18 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 192, C: 192, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L19 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 32, C: 192, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L20 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 32, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L21 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 192, C: 32, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L22 {
Type: DSCONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 192, C: 192, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L23 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 192, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L24 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 384, C: 64, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L25 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 384, C: 384, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L26 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 384, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L27 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 64, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L28 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 384, C: 64, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L29 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 384, C: 384, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L30 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 384, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L31 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 64, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L32 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 384, C: 64, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L33 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 384, C: 384, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L34 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 384, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L35 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 64, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L36 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 384, C: 64, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L37 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 384, C: 384, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L38 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 96, C: 384, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L39 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 576, C: 96, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L40 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 576, C: 576, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L41 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 96, C: 576, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L42 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 96, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L43 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 576, C: 96, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L44 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 576, C: 576, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L45 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 96, C: 576, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L46 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 96, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L47 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 576, C: 96, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L48 {
Type: DSCONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 576, C: 576, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L49 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 160, C: 576, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L50 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 960, C: 160, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L51 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 960, C: 960, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L52 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 160, C: 960, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L53 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 160, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L54 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 960, C: 160, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L55 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 960, C: 960, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L56 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 160, C: 960, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L57 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 160, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L58 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 960, C: 160, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L59 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 960, C: 960, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L60 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 320, C: 960, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L61 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1280, C: 320, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L62 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1000, C: 1280, R: 1, S: 1, Y: 1, X: 1 }
}
}