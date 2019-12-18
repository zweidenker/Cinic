accessing
actionValues
	| actionValues |
	actionValues := OrderedDictionary new.
 	self sectionsAndNamesDo: [ :section :name | 
		actionValues at: name put: (section actionValue) ].
	^ actionValues