validation
validateConfigurationFile
	"The command line handle should have one .json file"
	(self commandLine hasFileWithExtension: '.json')
			ifFalse: [ ^ self exitFailure: 'There should be one JSON file as argument' ]