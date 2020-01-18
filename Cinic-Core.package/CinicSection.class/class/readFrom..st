instance creation
readFrom: stream

	^ (NeoJSONReader on: stream)
			mapClass: CinicSection;
			propertyNamesAsSymbols: true;
			next