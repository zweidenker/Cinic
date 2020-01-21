json
jsonDeepWithExtendedKey
	^ '{ 
	"key1" : "value1", 
	"', self class subSectionName,'" : { 
		"[subkey1]" : "3+4",
		"subdeep" : { 
			"[subdeepkey]" : "CurrentCinic value"
	   }
	}}'