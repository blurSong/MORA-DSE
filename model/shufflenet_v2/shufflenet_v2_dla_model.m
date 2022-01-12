Network shufflenet_v2 {
Layer L0 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 24, C: 3, R: 3, S: 3, Y: 224, X: 224 }
}
Layer L1 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 24, C: 24, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L2 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 24, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L3 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 24, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L4 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L5 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L6 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L7 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L8 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L9 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L10 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L11 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L12 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L13 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L14 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L15 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L16 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L17 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L18 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L19 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 116, C: 58, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L20 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L21 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 58, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L22 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L23 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L24 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L25 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L26 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L27 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L28 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L29 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L30 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L31 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L32 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L33 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L34 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L35 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L36 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L37 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L38 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L39 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L40 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L41 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L42 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L43 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L44 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L45 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L46 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L47 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L48 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L49 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L50 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L51 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L52 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L53 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 232, C: 116, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L54 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L55 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 116, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L56 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L57 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L58 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L59 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L60 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L61 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L62 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L63 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L64 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L65 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L66 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L67 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L68 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L69 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L70 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L71 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 232, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L72 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1000, C: 1024, R: 1, S: 1, Y: 1, X: 1 }
}
}