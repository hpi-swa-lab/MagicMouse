events
isEventForMe: anEvent
	"True when this hand-level event concerns me: the pointer is over my bounds,
	or (for keyboard events) I currently hold the keyboard focus. Used to gate
	logging and rewriting so I ignore events destined for other windows."

	(self world notNil and: [self world == anEvent hand world]) ifFalse: [^ false].
	(self fullBounds containsPoint: anEvent position) ifTrue: [^ true].
	^ self activeHand notNil and: [self activeHand keyboardFocus == self]