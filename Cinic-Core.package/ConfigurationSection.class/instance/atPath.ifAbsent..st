accessing
atPath: aCollectionOfKeys ifAbsent: aBlock

	| section |
	section := self.
	aCollectionOfKeys do: [ :eachKey |
		section isDictionary ifFalse: [ ^ aBlock value ].
		section := (section at: eachKey).
		 ].
	^ section
	
