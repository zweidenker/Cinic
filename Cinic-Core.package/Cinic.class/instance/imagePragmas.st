private
imagePragmas
   | collector |
	collector := PragmaCollector new 
		filter: [ :pragma |  pragma keyword = #cinicStep ].
	^ collector 
		reset;
		select: [:each | 
			"only collect class side pragmas"
			each methodClass isMeta ]
