accessing
lookup: aPropertyOrSectionName
	"recursively lookup over nested sections"

	| result |
	result := self at: aPropertyOrSectionName.
	result ifNil: [ 
		self sectionsDo: [ :eachSection | 
					(eachSection lookup: aPropertyOrSectionName)
						ifNotNil: [ :aValue | ^ aValue ] ].
		 ].
	^ result