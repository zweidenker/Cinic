accessing
atPath: aCollectionOfKeys 
	
	^self atPath: aCollectionOfKeys ifAbsent: [KeyNotFound signalFor: aCollectionOfKeys]
	
