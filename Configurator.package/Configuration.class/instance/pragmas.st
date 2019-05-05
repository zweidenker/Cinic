private
pragmas
   | collector |
	collector := PragmaCollector new 
		filter: [ :pragma |  pragma keyword = #configurationStep ].
	^ collector 
		reset;
		collect: [ :each | each ]
