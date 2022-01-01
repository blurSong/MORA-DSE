Network resnet18 {
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
Layer L8 {
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
Layer L9 {
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
Layer L10 {
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
Layer L15 {
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
Layer L16 {
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
Layer L17 {
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
Layer L18 {
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
Layer L19 {
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
Layer L20 {
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
Layer L21 {
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
Layer L22 {
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
Layer L23 {
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
Layer L24 {
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
Layer L25 {
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
Layer L26 {
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
Layer L27 {
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
Layer L28 {
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