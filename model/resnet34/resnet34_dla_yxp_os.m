Network resnet34 {
Layer L0 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 64, C: 3, R: 8, S: 8, Y: 228, X: 228 }
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
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 56, X: 56 }
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
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 56, X: 56 }
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
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 64, R: 1, S: 1, Y: 56, X: 56 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L4 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 56, X: 56 }
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
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 56, X: 56 }
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
Dimensions { K: 1, C: 64, R: 1, S: 1, Y: 56, X: 56 }
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
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 56, X: 56 }
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
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 56, X: 56 }
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
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 64, R: 1, S: 1, Y: 56, X: 56 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L10 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 128, C: 64, R: 3, S: 3, Y: 56, X: 56 }
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
Layer L11 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 28, X: 28 }
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
Stride { X: 2, Y: 2 }
Dimensions { K: 128, C: 64, R: 3, S: 3, Y: 56, X: 56 }
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
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 128, R: 1, S: 1, Y: 28, X: 28 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L14 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 28, X: 28 }
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
Layer L15 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 28, X: 28 }
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
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 128, R: 1, S: 1, Y: 28, X: 28 }
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
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 28, X: 28 }
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
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 28, X: 28 }
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
Layer L19 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 128, R: 1, S: 1, Y: 28, X: 28 }
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
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 28, X: 28 }
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
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 28, X: 28 }
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
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 128, R: 1, S: 1, Y: 28, X: 28 }
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
Stride { X: 2, Y: 2 }
Dimensions { K: 256, C: 128, R: 3, S: 3, Y: 28, X: 28 }
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
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Layer L25 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 256, C: 128, R: 3, S: 3, Y: 28, X: 28 }
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
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 14, X: 14 }
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
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Layer L29 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L30 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 14, X: 14 }
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
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L36 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Layer L37 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 14, X: 14 }
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
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Layer L41 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 256, R: 1, S: 1, Y: 14, X: 14 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L42 {
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 512, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 7, X: 7 }
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
Type: CONV 
Stride { X: 2, Y: 2 }
Dimensions { K: 512, C: 256, R: 3, S: 3, Y: 14, X: 14 }
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
Layer L45 {
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L46 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 7, X: 7 }
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
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 7, X: 7 }
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
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 7, X: 7 }
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
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 7, X: 7 }
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
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 7, X: 7 }
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
Type: DSCONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1, C: 512, R: 1, S: 1, Y: 7, X: 7 }
Dataflow {
	TemporalMap(1,1) C;
	SpatialMap(Sz(R),1) Y;
	TemporalMap(Sz(S),1) X;
	TemporalMap(Sz(R),Sz(R)) R;
	TemporalMap(Sz(S),Sz(S)) S;
}
}
Layer L52 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1000, C: 512, R: 1, S: 1, Y: 1, X: 1 }
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