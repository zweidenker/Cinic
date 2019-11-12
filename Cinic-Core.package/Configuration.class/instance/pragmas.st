private
pragmas
   | collector |
	collector := PragmaCollector new 
		filter: [ :pragma |  pragma keyword = #configurationStep ].
	^ collector 
		reset;
		select: [:each | 
			"only collect class side pragmas"
			each methodClass isMeta ]
