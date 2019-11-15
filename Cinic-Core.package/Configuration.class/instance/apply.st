actions
apply

	rootSection paths do: [:eachPath |
		self steps do: [ :eachStep |  
			(eachStep matchesPath: eachPath) ifTrue: [ 
				eachStep executeWith: (rootSection atPath: eachPath)
				 ]
			]
		].
	
