as yet unclassified
readJSONFrom: aStream 

	^ self new 
		rootSection: (CinicSection readFrom: aStream)