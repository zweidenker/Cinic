tests
testNestedKeysUsageAsymmetry
	| config |
	config := self configDeepWithExtendedKey.
	config section: #sub do: [ :c |
		self assert: c subdeep subdeepkey equals: c.
		
		c section: #subdeep do: [ :cs |
			self assert: cs subdeepkey equals: cs ] ].
	
