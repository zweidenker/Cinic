tests
testCinicSteps
	| config propertyValue configSection |
	config := self configSimple.
	config apply.
	self assert: (self appliedCinics includesKey: self subSectionName). 
	configSection := (self appliedCinics at: self subSectionName) .
	propertyValue := configSection values anyOne.
	self assert: (self jsonSimple includesSubstring: propertyValue).
	
	config := self configWithExtendedKey.
	config apply.
	self assert: (self appliedCinics includesKey: self subSectionName). 
	configSection := (self appliedCinics at: self subSectionName).
	self deny: propertyValue =  configSection values anyOne.
	propertyValue := configSection values anyOne.
	self assert: (self jsonWithExtendedKey includesSubstring: propertyValue).
