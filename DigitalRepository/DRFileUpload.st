WAComponent subclass: #DRFileUpload
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DigitalRepository'!

!DRFileUpload methodsFor: 'rendering' stamp: 'mh 5/8/2010 03:07'!
renderContentOn: html
	html heading: '.dsim Dateien hochladen'.
	self renderUploadOn: html.
	self renderDeleteAllOn: html.
	self renderDownloadLinksOn: html.! !

!DRFileUpload methodsFor: 'rendering' stamp: 'mh 5/8/2010 03:08'!
renderDeleteAllOn: html

	html anchor
		callback: [DRImageDatabase flushFiles];
		with: 'Alle Loeschen'! !

!DRFileUpload methodsFor: 'rendering' stamp: 'mh 5/8/2010 03:21'!
renderDownloadLinksOn: html 
	DRImageDatabase files do: [ :file |
		html paragraph: 
		[ html anchor
			document: file contents 
				mimeType: file contentType
				fileName: file fileName;
			with: file fileName , ' (' , file contentType greaseString , ')'.
		 html space.
		 html anchor 
			callback: [DRImageDatabase removeFile: file];
			with: 'Loeschen'.	
			]
		]! !

!DRFileUpload methodsFor: 'rendering' stamp: 'mh 5/8/2010 02:42'!
renderUploadOn: html

	html form
		multipart;
		with: [
			html div: [
				"div for HTML validation"
				html fileUpload callback: [ :f | DRImageDatabase addFile: f ].
				html submitButton text: 'Speichern' ] ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

DRFileUpload class
	instanceVariableNames: ''!

!DRFileUpload class methodsFor: 'testing' stamp: 'mh 5/6/2010 23:19'!
canBeRoot 

	^ true! !
