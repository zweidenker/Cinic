tests
testDictionaryAsCinicStepWrongKeys
	| dict |
	dict := { #abc -> #def . #ghi -> #jkl }.
	self 
		should: [ dict asCinicStep  ] 
		raise: Error 