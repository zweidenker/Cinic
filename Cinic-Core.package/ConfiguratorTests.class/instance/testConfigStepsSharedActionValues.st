tests
testConfigStepsSharedActionValues
	| config actionValues |
	config := self configSectionsSharedActionValues.
	config apply.
	actionValues := config tree actionValues.
	self assert: actionValues size equals: 2.
	self assert: (actionValues at: 'dependsOnSharedActionValueSection') equals: 'it is really an important a string'