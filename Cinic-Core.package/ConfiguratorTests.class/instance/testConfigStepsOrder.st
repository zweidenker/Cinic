tests
testConfigStepsOrder
	"check that configuration steps are executed in the same order as the associated section order in the configuration file"

	| config steps executedStepSections |
	config := self configNestedSections.
	executedStepSections := OrderedCollection new.
	steps := #('A' 'C'  'Ba2' 'B' 'Bb' 'Ca' 'Ba' 'Ba1') collect: [:eachSectionName |
		ConfigurationStep new
			sectionPath: (eachSectionName asOrderedCollection collect: #asString);
			action: [ :c | executedStepSections add: eachSectionName  ]
		].
	config steps: steps.
	config apply.
	self assert: (executedStepSections at: 1) = 'A'.
	self assert: (executedStepSections at: 2) = 'B'.
	self assert: (executedStepSections at: 3) = 'Ba'.
	self assert: (executedStepSections at: 4) = 'Ba1'.
	self assert: (executedStepSections at: 5) = 'Ba2'.
	self assert: (executedStepSections at: 6) = 'Bb'.
	self assert: (executedStepSections at: 7) = 'C'.
	self assert: (executedStepSections at: 8) = 'Ca'.