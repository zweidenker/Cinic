json
jsonNestedSections
	^ '{ 
	"A" : { "subkey1" : "subvalue1" },  
	"B" : { 
		"a" : { 
			"1" : { "subkey211" : "subvalue" },
			"2" : { "subkey212" : "subvalue" }
			},
		"b" : { "subkey22" : "subvalue" } 
		},
	"C" : { 
		"a" : { "subkey31" : "subvalue1" }
		}
		}'