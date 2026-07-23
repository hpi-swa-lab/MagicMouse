-> to chrome
sendEvent: anEventType withModifiers: anEvent
	"Send a buttonless event (mouse up/down) with a trailing modifier byte so
	run.js can hold Ctrl/Alt/Shift/Cmd around the click. The frame is length
	prefixed, so an older run.js simply ignores the extra byte."

	self
		sendEvent: anEventType
		withBuffer: (ByteArray with: (self modifierByteFor: anEvent))