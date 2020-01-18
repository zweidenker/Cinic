resources
subSectionStep
	<cinicStep>
	^ CinicStep new
		section: self subSectionName;
		action: [ :config | self appliedCinics at: self subSectionName put: config  ]