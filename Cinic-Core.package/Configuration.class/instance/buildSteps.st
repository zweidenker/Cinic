private
buildSteps 
	^ self pragmas collect: [ :pragma | 
		(pragma method
			valueWithReceiver: pragma methodClass instanceSide
			arguments: {  }) asConfigurationStep ]