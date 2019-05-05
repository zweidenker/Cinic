as yet unclassified
readJSONFrom: aStream 
	^ self new 
		rootSection: (ConfigurationSection readFrom: aStream)