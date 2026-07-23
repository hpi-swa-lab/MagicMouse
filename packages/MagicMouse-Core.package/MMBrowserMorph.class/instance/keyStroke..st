events
keyStroke: anEvent

	anEvent keyString = '<Cmd-l>'
		ifTrue: [^ self fullscreen: previousOwner isNil].
	anEvent keyString = '<Cmd-c>'
		ifTrue: [^ self copySelection].
	self logEvent: ['keyStroke: ', anEvent keyString, ' -> ', (self keyStringWithAllModifiers: anEvent)].
	self sendEvent: #keyPress withString: (self keyStringWithAllModifiers: anEvent)