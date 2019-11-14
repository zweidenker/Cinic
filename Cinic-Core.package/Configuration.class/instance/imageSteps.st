private
imageSteps 
	^ self imagePragmas collect: [ :pragma | 
		(pragma method
			valueWithReceiver: pragma methodClass instanceSide
			arguments: {  }) asConfigurationStep ]