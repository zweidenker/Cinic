*Cinic-Core
cinicSend: selector to: anObject
	anObject 
		perform: selector asMutator 
		with: (CurrentCinic value perform: self)