actions
apply

	rootSection allSectionsAndNamesDo: [ :eachSection :eachName |
		self steps detect: [ :eachStep |
			eachStep group = eachName
			 ] ifFound: [ :matchingStep |
				matchingStep executeWith: eachSection
			 ]
		 ]
