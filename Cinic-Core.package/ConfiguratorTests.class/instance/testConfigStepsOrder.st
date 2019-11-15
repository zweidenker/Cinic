tests
testConfigStepsOrder
	"check that configuration steps are executed in the same order as the associated section order in the configuration file"

	| config steps executedStepSections |
	config := self configNestedSections.
	executedStepSections := OrderedCollection new.
	steps := #('1' '3'  '212' '2' '22' '31' '21' '211') collect: [:eachSectionName |
		ConfigurationStep new
			sectionPath: (eachSectionName asOrderedCollection collect: #asString);
			action: [ :c | executedStepSections add: eachSectionName  ]
		].
	config steps: steps.
	config apply.
	self assert: (executedStepSections at: 1) = '1'.
	self assert: (executedStepSections at: 2) = '2'.
	self assert: (executedStepSections at: 3) = '21'.
	self assert: (executedStepSections at: 4) = '211'.
	self assert: (executedStepSections at: 5) = '212'.
	self assert: (executedStepSections at: 6) = '22'.
	self assert: (executedStepSections at: 7) = '3'.
	self assert: (executedStepSections at: 8) = '31'.