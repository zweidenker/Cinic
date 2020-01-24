validation
activate
	self activateHelp ifTrue: [ ^ self ].
	self validateConfigurationFile.
	self readConfigurationAndApply.
	(self hasOption: 'save')
		ifTrue: [ Smalltalk snapshot: true andQuit: false ].
	self exitSuccess