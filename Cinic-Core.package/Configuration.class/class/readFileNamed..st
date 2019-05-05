reading
readFileNamed: aString 
	| file reader |
	file := aString asFileReference.
	reader := self readerForExtension: file extension.
	^ reader value: file readStream