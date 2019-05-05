private
executeStep: step
	| section |
	section := self lookup: step group.
	section do: [ 
		step executeWith: section ]