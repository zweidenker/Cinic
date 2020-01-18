accessing
extendedAt: key 
	| extendedKey |
	"extended key lookup. Keys can be surrounded by [] meaning the value 
	should be evaluated to get a value"
	extendedKey := String streamContents: [ :stream |
		stream << '[' << key << ']' ].
	^ (self includesKey: extendedKey)
		ifTrue: [ self class compiler evaluate: (self at: extendedKey) ]
		ifFalse: [ nil ]
