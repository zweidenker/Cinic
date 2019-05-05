tests
testParseExtended
	| config |
	config := self configWithExtendedKey.
	self assert: config tree sub subkey1 equals: 7 