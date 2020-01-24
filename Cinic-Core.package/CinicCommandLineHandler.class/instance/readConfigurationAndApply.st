validation
readConfigurationAndApply
	| file cinicConfig |
	file := self firstJsonFileArgument.
	[ [ cinicConfig := Cinic readFileNamed: file asFileReference ]
		on: FileDoesNotExistException
		do: [ ^ self exitFailure: 'Such file was not found' ] ]
		on: NeoJSONParseError
		do: [ ^ self exitFailure: 'Failed to parse the json file'  ].
	cinicConfig apply