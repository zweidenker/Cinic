private
buildSteps 
	^ self pragmas collect: [ :pragma | 
		(pragma method
			valueWithReceiver: nil 
			arguments: {  }) asConfigurationStep ]