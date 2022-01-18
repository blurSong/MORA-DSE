Network shufflenet_v2 {
Layer L0 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 24, C: 3, R: 3, S: 3, Y: 224, X: 224 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L1 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 24, C: 24, R: 3, S: 3, Y: 56, X: 56 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L2 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 24, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L3 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 24, R: 1, S: 1, Y: 56, X: 56 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L4 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 56, X: 56 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L5 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L6 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L8 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L9 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L10 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L12 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L13 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L14 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L16 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 3, S: 3, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L17 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 58, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L18 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L19 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 116, C: 58, R: 3, S: 3, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L20 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L21 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 58, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L22 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L23 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L24 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L26 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L27 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L28 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L30 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L31 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L32 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L34 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L35 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L36 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L38 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L39 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L40 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L42 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L43 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L44 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L46 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L47 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L48 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L50 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L51 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 116, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L52 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L53 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 232, C: 116, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L54 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L55 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 116, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L56 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L57 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L58 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L60 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L61 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L62 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L64 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L65 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L66 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
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
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L68 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 3, S: 3, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L69 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 232, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L70 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L71 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1024, C: 232, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
Layer L72 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1000, C: 1024, R: 1, S: 1, Y: 1, X: 1 }
Dataflow {
	TemporalMap(1,1) K;
	TemporalMap(1,1) C;
	SpatialMap(Sz(R), 1) Y;
	TemporalMap(8,8) X;
	Cluster(8, P);
	SpatialMap(Sz(S), 1) X;
	TemporalMap(Sz(R), Sz(R)) R;
	TemporalMap(Sz(R), Sz(R)) S;	
}		
		}
}