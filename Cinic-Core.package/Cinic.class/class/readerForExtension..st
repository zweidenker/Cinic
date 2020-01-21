as yet unclassified
readerForExtension: aString 

	^ self extensionMapping 
		at: aString
		ifAbsent: [ Error signal: 'no reader for extension ', aString ]