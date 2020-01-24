validation
readConfigurationAndApply
	| file cinicConfig |
	file := self firstJsonFileArgument.
	cinicConfig := Cinic readFileNamed: file asFileReference.
	cinicConfig apply