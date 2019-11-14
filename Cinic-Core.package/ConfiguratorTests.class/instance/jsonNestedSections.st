json
jsonNestedSections
	^ '{ 
	"section1" : { "subkey1" : "subvalue1" },  
	"section2" : { 
		"section21" : { 
			"section211" : { "subkey211" : "subvalue" },
			"section212" : { "subkey212" : "subvalue" }
			},
		"section22" : { "subkey22" : "subvalue" } 
		},
	"section3" : { 
		"section31" : { "subkey31" : "subvalue1" }
		}
		}'