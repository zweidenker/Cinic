tests
testParseSimple
	| config |
	config := self configSimple .
	self assert: config tree keys size equals: 2.
	self assert: (config tree includesKey: 'sub')