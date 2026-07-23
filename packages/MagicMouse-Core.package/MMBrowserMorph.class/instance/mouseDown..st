events
mouseDown: anEvent

	| position |
	self logEvent: ['mouseDown: yellow=', anEvent yellowButtonChanged printString,
		' mods=', (self modifierByteFor: anEvent) printString].
	self isConnected ifFalse: [^ self reconnect].
	position := anEvent position - self position max: 0 @ 0.
	(self class portalsOnRightClick and: [anEvent yellowButtonChanged])
		ifTrue: [self sendEvent: #portal withPoint: position]
		ifFalse: [
			self
				sendEvent: #mouseMove withPoint: position;
				sendEvent: (anEvent yellowButtonChanged
					ifTrue: [#mouseRightDown]
					ifFalse: [#mouseLeftDown])
				withModifiers: anEvent.
			self activeHand keyboardFocus == self ifTrue: [^ self].
			self activeHand newKeyboardFocus: self]