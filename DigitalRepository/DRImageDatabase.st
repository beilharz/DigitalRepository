Object subclass: #DRImageDatabase
	instanceVariableNames: ''
	classVariableNames: 'Files'
	poolDictionaries: ''
	category: 'DigitalRepository'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

DRImageDatabase class
	instanceVariableNames: ''!

!DRImageDatabase class methodsFor: 'accessing' stamp: 'mh 5/8/2010 02:43'!
addFile: aFile

	self files add: aFile.
	self saveImage.
	^ aFile! !

!DRImageDatabase class methodsFor: 'accessing' stamp: 'mh 5/8/2010 02:28'!
files
	^ Files ifNil: [Files := OrderedCollection new].! !

!DRImageDatabase class methodsFor: 'accessing' stamp: 'mh 5/8/2010 03:48'!
flushFiles

	Files ifNotEmpty: [ Files := OrderedCollection new.
	self saveImage.].! !

!DRImageDatabase class methodsFor: 'accessing' stamp: 'mh 5/8/2010 03:19'!
removeFile: aFile

	self files remove: aFile.
	self saveImage.
	^ aFile! !


!DRImageDatabase class methodsFor: 'saving' stamp: 'mh 5/8/2010 02:44'!
saveImage

	SmalltalkImage current saveSession! !
