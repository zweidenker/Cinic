resources
subSectionStep
	<configurationStep>
	^ ConfigurationStep new
		section: self subSectionName;
		action: [ :config | self appliedConfigs at: self subSectionName put: config  ]