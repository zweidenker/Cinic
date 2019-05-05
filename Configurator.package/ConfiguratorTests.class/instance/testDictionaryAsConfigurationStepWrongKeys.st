tests
testDictionaryAsConfigurationStepWrongKeys
	| dict |
	dict := { #abc -> #def . #ghi -> #jkl }.
	self 
		should: [ dict asConfigurationStep  ] 
		raise: Error 