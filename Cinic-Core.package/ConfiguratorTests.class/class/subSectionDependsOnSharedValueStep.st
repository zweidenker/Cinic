resources
subSectionDependsOnSharedValueStep
	<configurationStep>
	^ ConfigurationStep new
		section: 'dependsOnSharedActionValueSection';
		action: [ :config |
			config actionValue: 'it is really ', (config actionValueAtPath: {'sharingActionValueSection'}) ]