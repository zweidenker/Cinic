accessing
at: key put: value
	(value class = ConfigurationSection) ifTrue: [ 
		value parent: self ].
	^ super at: key put: value