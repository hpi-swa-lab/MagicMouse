events
mouseWheel: anEvent

	self logEvent: ['mouseWheel: up=', anEvent isWheelUp printString,
		' mods=', (self modifierByteFor: anEvent) printString].
	self sendEvent: #mouseWheel withBuffer: ((ByteArray new: 5)
		unsignedLongAt: 1 put: (anEvent isWheelUp ifTrue: [0] ifFalse: [1]);
		at: 5 put: (self modifierByteFor: anEvent);
		yourself)