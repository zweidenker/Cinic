accessing
steps 
	^ steps ifNil: [ 
		steps :=  self buildSteps ]