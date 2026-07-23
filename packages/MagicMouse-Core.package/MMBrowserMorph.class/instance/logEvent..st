events
logEvent: aStringBlock
	"Print an event-routing diagnostic to the Transcript, but only when the
	'Debug input events' preference is on. Takes a block so the (possibly costly)
	string is not built when logging is off."

	self class debugEvents ifTrue: [Transcript showln: aStringBlock value]