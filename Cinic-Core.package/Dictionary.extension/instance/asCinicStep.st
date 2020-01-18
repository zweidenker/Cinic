*Cinic-Core
asCinicStep
	^ self associations 
		inject: CinicStep new 
		into: [ :step :assoc | 
			step perform: assoc key asSymbol asMutator with: assoc value ]