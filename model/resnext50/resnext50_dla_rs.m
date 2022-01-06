Network resnext50 {
Layer L0 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 64, C: 3, R: 8, S: 8, Y: 228, X: 228 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L1 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 64, R: 1, S: 1, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L2 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 128, C: 128, R: 3, S: 3, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L3 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 128, R: 1, S: 1, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L4 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 64, R: 1, S: 1, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L5 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 56, X: 56 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L6 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 256, R: 1, S: 1, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L7 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 128, C: 128, R: 3, S: 3, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L8 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 128, R: 1, S: 1, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L9 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 56, X: 56 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L10 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 256, R: 1, S: 1, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L11 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 128, C: 128, R: 3, S: 3, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L12 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 128, R: 1, S: 1, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L13 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 56, X: 56 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L14 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 1, S: 1, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L15 {
Type: NGCONV 
Stride { X: 2, Y: 2 }
Dimensions { G: 32, K: 256, C: 256, R: 3, S: 3, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L16 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 256, R: 1, S: 1, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L17 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 512, C: 256, R: 3, S: 3, Y: 56, X: 56 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L18 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L19 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 512, R: 1, S: 1, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L20 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 256, C: 256, R: 3, S: 3, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L21 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 256, R: 1, S: 1, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L22 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L23 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 512, R: 1, S: 1, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L24 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 256, C: 256, R: 3, S: 3, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L25 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 256, R: 1, S: 1, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L26 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L27 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 512, R: 1, S: 1, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L28 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 256, C: 256, R: 3, S: 3, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L29 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 256, R: 1, S: 1, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L30 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L31 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 1, S: 1, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L32 {
Type: NGCONV 
Stride { X: 2, Y: 2 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L33 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L34 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 1024, C: 512, R: 3, S: 3, Y: 28, X: 28 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L35 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L36 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L37 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L38 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L39 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L40 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L41 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L42 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L43 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L44 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L45 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L46 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L47 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L48 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L49 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L50 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L51 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L52 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L53 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L54 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 512, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L55 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L56 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 1024, R: 1, S: 1, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L57 {
Type: NGCONV 
Stride { X: 2, Y: 2 }
Dimensions { G: 32, K: 1024, C: 1024, R: 3, S: 3, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L58 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 2048, C: 1024, R: 1, S: 1, Y: 7, X: 7 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L59 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 2048, C: 1024, R: 3, S: 3, Y: 14, X: 14 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L60 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 2048, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L61 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 2048, R: 1, S: 1, Y: 7, X: 7 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L62 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 1024, C: 1024, R: 3, S: 3, Y: 7, X: 7 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L63 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 2048, C: 1024, R: 1, S: 1, Y: 7, X: 7 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L64 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 2048, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L65 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 2048, R: 1, S: 1, Y: 7, X: 7 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L66 {
Type: NGCONV 
Stride { X: 1, Y: 1 }
Dimensions { G: 32, K: 1024, C: 1024, R: 3, S: 3, Y: 7, X: 7 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L67 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 2048, C: 1024, R: 1, S: 1, Y: 7, X: 7 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L68 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 2048, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	SpatialMap(1,1) C;
	TemporalMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L69 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1000, C: 2048, R: 1, S: 1, Y: 1, X: 1 }
 Dataflow {
     // This is an Eyeriss-like row-stationary dataflow” 
    SpatialMap(1,1) Y';
    TemporalMap(1,1) X';
    TemporalMap(1,1) C;
    TemporalMap(16,16) K;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
    Cluster(Sz(R),P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
}