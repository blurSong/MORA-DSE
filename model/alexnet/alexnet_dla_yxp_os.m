Network alexnet {
Layer L0 {
Type: CONV 
Stride { X: 4, Y: 4 }
Dimensions { K: 64, C: 3, R: 11, S: 11, Y: 225, X: 225 }
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
Dimensions { K: 192, C: 64, R: 5, S: 5, Y: 27, X: 27 }
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
Dimensions { K: 384, C: 192, R: 3, S: 3, Y: 13, X: 13 }
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
Dimensions { K: 256, C: 384, R: 3, S: 3, Y: 13, X: 13 }
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
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 13, X: 13 }
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
Dimensions { K: 4096, C: 256, R: 1, S: 1, Y: 1, X: 1 }
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
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 4096, C: 4096, R: 1, S: 1, Y: 1, X: 1 }
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
Layer L7 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 1000, C: 4096, R: 1, S: 1, Y: 1, X: 1 }
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