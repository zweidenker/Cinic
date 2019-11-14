iterating
sectionsDo: aBlock

	self sectionsAndNamesDo: [ :eachSection :eachName |
		aBlock valueWithArguments: { eachSection }
		 ]