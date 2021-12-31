Network vgg16 {
Layer L0 {
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 64, C: 3, R: 3, S: 3, Y: 224, X: 224 }
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
Dimensions { K: 64, C: 64, R: 3, S: 3, Y: 224, X: 224 }
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
Dimensions { K: 128, C: 64, R: 3, S: 3, Y: 112, X: 112 }
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
Dimensions { K: 128, C: 128, R: 3, S: 3, Y: 112, X: 112 }
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
Stride { X: 1, Y: 1 }
Dimensions { K: 256, C: 128, R: 3, S: 3, Y: 56, X: 56 }
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
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 56, X: 56 }
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
Dimensions { K: 256, C: 256, R: 3, S: 3, Y: 56, X: 56 }
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
Dimensions { K: 512, C: 256, R: 3, S: 3, Y: 28, X: 28 }
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
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 28, X: 28 }
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
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 28, X: 28 }
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
Type: CONV 
Stride { X: 1, Y: 1 }
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
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
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
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
Dimensions { K: 512, C: 512, R: 3, S: 3, Y: 14, X: 14 }
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
Dimensions { K: 4096, C: 2048, R: 1, S: 1, Y: 1, X: 1 }
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
Layer L15 {
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