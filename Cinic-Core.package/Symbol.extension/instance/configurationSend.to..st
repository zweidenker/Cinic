*Cinic-Core
configurationSend: selector to: anObject
	anObject 
		perform: selector asMutator 
		with: (CurrentConfiguration value perform: self)