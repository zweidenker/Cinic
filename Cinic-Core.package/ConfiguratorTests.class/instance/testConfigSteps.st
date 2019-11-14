tests
testConfigSteps
	| config propertyValue configSection |
	config := self configSimple.
	config apply.
	self assert: (self appliedConfigs includesKey: self subSectionName). 
	configSection := (self appliedConfigs at: self subSectionName) .
	propertyValue := configSection values anyOne.
	self assert: (self jsonSimple includesSubstring: propertyValue).
	
	config := self configWithExtendedKey.
	config apply.
	self assert: (self appliedConfigs includesKey: self subSectionName). 
	configSection := (self appliedConfigs at: self subSectionName).
	self deny: propertyValue =  configSection values anyOne.
	propertyValue := configSection values anyOne.
	self assert: (self jsonWithExtendedKey includesSubstring: propertyValue).
