Network shufflenet_v2 {
Layer L0 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 24, C: 3, R: 3, S: 3, Y: 224, X: 224 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L1 {
Type: DSCONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 24, C: 24, R: 3, S: 3, Y: 56, X: 56 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L2 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 24, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L3 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 24, R: 1, S: 1, Y: 56, X: 56 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L4 {
Type: DSCONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 56, X: 56 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L5 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L6 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L7 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L8 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L9 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L10 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L11 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L12 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L13 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L14 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L15 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L16 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L17 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L18 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L19 {
Type: DSCONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L20 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L21 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L22 {
Type: DSCONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L23 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L24 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L25 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L26 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L27 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L28 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L29 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L30 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L31 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L32 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L33 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L34 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L35 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L36 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L37 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L38 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L39 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L40 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L41 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L42 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L43 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L44 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L45 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L46 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L47 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L48 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L49 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L50 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L51 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L52 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L53 {
Type: DSCONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L54 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L55 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L56 {
Type: DSCONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L57 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L58 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 464, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L59 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L60 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L61 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L62 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 464, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L63 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L64 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L65 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L66 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 464, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L67 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L68 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L69 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L70 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 464, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L71 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 464, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L72 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1000, C: 1024, R: 1, S: 1, Y: 1, X: 1 }
Dataflow {
    TemporalMap(16,16) K;
    SpatialMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(1,1) C;
    Cluster(16, P);
    SpatialMap(1,1) K;
    TemporalMap(Sz(R),1) Y;
    TemporalMap(Sz(S),1) X;
    TemporalMap(Sz(R),Sz(R)) R;
    TemporalMap(Sz(S),Sz(S)) S;
}
}
}