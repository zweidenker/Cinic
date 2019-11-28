tests
testConfigStepsOrderWithMultipleMatches
	"check that configuration a given step matches several sections from a configuration file, it gets executed several times.
	Example:
	
	section a {
		section a { 
		...
		 }
	  }
	
	a step defined with sectionPath #(a) will match both paths: #(a) and #(a a)
	"

	| config steps executedStepSections |
	config := self configNestedSectionsMultipleMatch .
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
	"the step pointing to #(1) will also match path #(2 1): "
	self assert: (executedStepSections at: 3) = '1'.
	self assert: (executedStepSections at: 4) = '21'.
	"the step pointing to #(1) will also match path #(2 1 1): "
	self assert: (executedStepSections at: 5) = '1'.
	self assert: (executedStepSections at: 6) = '211'.
	self assert: (executedStepSections at: 7) = '212'.
	"the step pointing to #(2) will also match path #(2 1 2): "
	self assert: (executedStepSections at: 8) = '2'.
	"the step pointing to #(2) will also match path #(2): "
	self assert: (executedStepSections at: 9) = '2'.
	self assert: (executedStepSections at: 10) = '22'.
	self assert: (executedStepSections at: 11) = '3'.
	"the step pointing to #(1) will also match path #(3 1): "
	self assert: (executedStepSections at: 12) = '1'.
	self assert: (executedStepSections at: 13) = '31'.