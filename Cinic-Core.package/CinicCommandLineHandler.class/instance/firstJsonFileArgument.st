validation
firstJsonFileArgument
	^ self arguments detect: [ :arg|
		arg endsWith: '.json' ]