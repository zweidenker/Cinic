as yet unclassified
extensionMapping

	^ { 
		'json' -> [ :stream | self readJSONFrom: stream ] } asDictionary
			