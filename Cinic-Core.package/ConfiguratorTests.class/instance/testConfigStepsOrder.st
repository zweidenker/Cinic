tests
testConfigStepsOrder
	"check that configuration steps are executed in the same order as the associated section order in the configuration file"

	| config steps executedStepSections |
	config := self configNestedSections.
	executedStepSections := OrderedCollection new.
	steps := #('section1' 'section3'  'section212' 'section2' 'section22' 'section31' 'section21' 'section211') collect: [:eachSectionName |
		ConfigurationStep new
			group: eachSectionName;
			action: [ :c | executedStepSections add: eachSectionName  ]
		].
	config steps: steps.
	config apply.
	self assert: (executedStepSections at: 1) = 'section1'.
	self assert: (executedStepSections at: 2) = 'section2'.
	self assert: (executedStepSections at: 3) = 'section21'.
	self assert: (executedStepSections at: 4) = 'section211'.
	self assert: (executedStepSections at: 5) = 'section212'.
	self assert: (executedStepSections at: 6) = 'section22'.
	self assert: (executedStepSections at: 7) = 'section3'.
	self assert: (executedStepSections at: 8) = 'section31'.