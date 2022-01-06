Network resnext50 {
Layer L0 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 64, C: 3, R: 8, S: 8, Y: 228, X: 228 }
}
Layer L1 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 64, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L2 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 128, C: 128, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L3 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 128, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L4 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 64, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L5 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L6 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 256, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L7 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 128, C: 128, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L8 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 128, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L9 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L10 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 256, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L11 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 128, C: 128, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L12 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 128, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L13 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L14 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 1, S: 1, Y: 56, X: 56 }
}
Layer L15 {
Type: NGCONV 
Stride { X: 2, Y: 2 }
Dimensions { G: 32, K: 256, C: 256, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L16 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 256, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L17 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 512, C: 256, R: 3, S: 3, Y: 56, X: 56 }
}
Layer L18 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L19 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 512, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L20 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 256, C: 256, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L21 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 256, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L22 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L23 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 512, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L24 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 256, C: 256, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L25 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 256, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L26 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L27 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 512, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L28 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 256, C: 256, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L29 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 256, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L30 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L31 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L32 {
Type: NGCONV 
Stride { X: 2, Y: 2 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L33 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 28, X: 28 }
}
Layer L34 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 1024, C: 512, R: 3, S: 3, Y: 28, X: 28 }
}
Layer L35 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L36 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L37 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L38 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L39 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L40 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L41 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L42 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L43 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L44 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L45 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L46 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L47 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L48 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L49 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L50 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L51 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L52 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L53 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L54 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L55 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L56 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
}
Layer L57 {
Type: NGCONV 
Stride { X: 2, Y: 2 }
Dimensions { G: 32, K: 1024, C: 1024, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L58 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 2048, C: 1024, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L59 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 2048, C: 1024, R: 3, S: 3, Y: 14, X: 14 }
}
Layer L60 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 2048, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L61 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 2048, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L62 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 1024, C: 1024, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L63 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 2048, C: 1024, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L64 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 2048, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L65 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 2048, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L66 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 1024, C: 1024, R: 3, S: 3, Y: 7, X: 7 }
}
Layer L67 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 2048, C: 1024, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L68 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 2048, R: 1, S: 1, Y: 7, X: 7 }
}
Layer L69 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1000, C: 2048, R: 1, S: 1, Y: 1, X: 1 }
}
}