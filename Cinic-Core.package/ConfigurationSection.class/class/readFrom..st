instance creation
readFrom: stream

	^ (NeoJSONReader on: stream)
			mapClass: ConfigurationSection;
			propertyNamesAsSymbols: true;
			next