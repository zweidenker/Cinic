*Cinic-Core
asConfigurationStep
	^ self associations 
		inject: ConfigurationStep new 
		into: [ :step :assoc | 
			step perform: assoc key asSymbol asMutator with: assoc value ]