accessing
root 
	self isRoot ifTrue: [^ self].
	^ parent root