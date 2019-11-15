private
buildSteps 
	
	^ (self imageSteps select: [ :eachStep | (self lookup: eachStep group) notNil ])