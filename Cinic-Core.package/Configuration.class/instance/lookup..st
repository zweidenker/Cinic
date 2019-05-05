sections
lookup: aString 
	"Lookup can be improved later. This is for cases where the group
	defintion of a step and label/nesting in the configuration file 
	is not the same"
	"Here we assume that there are only top-level groups having the same
	name"
	^ rootSection at: aString