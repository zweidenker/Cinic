accessing
at: key put: value
	(value class = CinicSection) ifTrue: [ 
		value parent: self ].
	^ super at: key put: value