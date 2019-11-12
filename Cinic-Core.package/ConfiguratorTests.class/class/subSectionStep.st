resources
subSectionStep
	<configurationStep>
	^ ConfigurationStep new
		group: self subSectionName;
		action: [ :config | self appliedConfigs at: self subSectionName put: config  ]