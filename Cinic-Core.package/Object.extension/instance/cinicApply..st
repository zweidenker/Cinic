*Cinic-Core
cinicApply: aSymbol
	self 
		perform: aSymbol asMutator 
		with: (CurrentCinic value perform: aSymbol)