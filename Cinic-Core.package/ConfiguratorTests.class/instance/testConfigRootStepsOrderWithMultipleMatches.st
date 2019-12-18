tests
testConfigRootStepsOrderWithMultipleMatches
	"check that several same sections at root from a configuration file, do not get executed several times.
	Example:
	
	section 1 { ... }
	section 2 { ... }
	section 2 { ... }
	"

	| config steps executedStepSections |
	config := self configSectionsMultipleMatch.
	self assert: config tree keys size equals: 2.
	executedStepSections := OrderedCollection new.
	steps := config tree keys collect: [:eachSectionName |
		ConfigurationStep new
			sectionPath: (eachSectionName asOrderedCollection collect: #asString);
			action: [ :c | executedStepSections add: eachSectionName  ]
		].
	config steps: steps.
	config apply.
	self assert: (executedStepSections at: 1) = '1'.
	self assert: (executedStepSections at: 2) = '2'.
	self should: [ executedStepSections at: 3 ] raise: SubscriptOutOfBounds.