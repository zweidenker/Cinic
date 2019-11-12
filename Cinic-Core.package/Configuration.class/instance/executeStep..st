private
executeStep: step
	| section |
	section := self lookup: step group.
	section ifNotNil: [ :aSection |
		aSection do: [ 
		step executeWith: aSection ]]