accessing
pathsFrom: parentPath

	| result path |
	result := OrderedCollection new.
	self keysAndValuesDo: [ :eachKey :eachValue |
		path := OrderedCollection new addAll: parentPath; add: eachKey; yourself.
		result add: path.
		eachValue isDictionary  ifTrue: [
			result addAll: (eachValue pathsFrom: path)].
		 ].
	^ result