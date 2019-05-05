tests
testNestedDynamicVariablePlusExtended
	| config |
	config := self configWithExtendedKey.
	config section: #sub do: [ 
		 self assert: CurrentConfiguration value subkey1 equals: 7].
