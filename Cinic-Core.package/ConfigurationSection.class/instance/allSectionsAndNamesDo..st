iterating
allSectionsAndNamesDo: aBlock
	"in addition to #sectionsAndNamesDo:, I will also iterate over nested section"

	self sectionsAndNamesDo: [ :eachSection :eachSectionName |
		aBlock valueWithArguments: { eachSection. eachSectionName }.
		eachSection allSectionsAndNamesDo: aBlock
		 ]