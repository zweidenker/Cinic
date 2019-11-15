accessing
atPath: aCollectionOfKeys ifAbsent: aBlock

	| section |
	section := self.
	aCollectionOfKeys do: [ :eachKey |
		(section isKindOf: ConfigurationSection) ifFalse: [ ^ aBlock value ].
		section := (section at: eachKey).
		 ].
	^ section
	
