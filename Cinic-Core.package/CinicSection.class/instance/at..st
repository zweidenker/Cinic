accessing
at: key	

	^ self 
		at: key 
		ifAbsent: [ self extendedAt: key ].
