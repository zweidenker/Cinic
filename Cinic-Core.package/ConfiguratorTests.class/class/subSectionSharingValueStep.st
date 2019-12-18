resources
subSectionSharingValueStep
	<configurationStep>
	^ ConfigurationStep new
		section: 'sharingActionValueSection';
		action: [ :config | 
			config actionValue: 'an important ', (config at: #key1)	 ]