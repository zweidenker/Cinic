*Cinic-Core
configure: aSymbol
	self 
		perform: aSymbol asMutator 
		with: (CurrentConfiguration value perform: aSymbol)