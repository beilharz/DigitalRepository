Object subclass: #DRConverter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DigitalRepository'!

!DRConverter methodsFor: 'as yet unclassified' stamp: 'mh 5/12/2010 01:36:38.572'!
findAndIn: aFile
 
	| identifierIndex locationIndex |
	identifierIndex := aFile asString findString: 'OBJ_AND' startingAt: 189.
	locationIndex := identifierIndex + (aFile at: (identifierIndex -  1)).
	^(DRGateAND new)
		locationX: (aFile longAt: locationIndex bigEndian: false);
		locationY: (aFile longAt: locationIndex+ 4 bigEndian: false).
		"(aFile at: locationIndex +1) asString + (aFile at: locationIndex) asString"
! !
