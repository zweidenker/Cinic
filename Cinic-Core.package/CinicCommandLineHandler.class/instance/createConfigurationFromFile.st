validation
createConfigurationFromFile
	| file cinicConfig |
	file := self firstJsonFileArgument.
	cinicConfig := Cinic readFileNamed:  file asFileReference.