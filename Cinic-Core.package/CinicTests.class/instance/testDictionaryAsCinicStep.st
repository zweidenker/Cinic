tests
testDictionaryAsCinicStep
	| dict step value |
	dict := { #section -> #def . #action -> [:c| value := c tree key1 ] }.
	self 
		shouldnt: [ step := dict asCinicStep  ] 
		raise: Error.
	self assert: (step executeWith: self configSimple) equals: #value1