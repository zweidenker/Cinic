iterating
sectionsAndNamesDo: aBlock
	"this method is expected to be performed with a two arguments block .
	i will iterate over my inner sections. 
	For each inner section i will execute the passed block with:
	- the section as first argument
	- the section name as second argument"
	| section |
	self keysDo: [ :eachName |
		section := (self at: eachName).
		(section isKindOf: ConfigurationSection) ifTrue: [ 
			aBlock valueWithArguments: { section. eachName }
			 ]
		 ]