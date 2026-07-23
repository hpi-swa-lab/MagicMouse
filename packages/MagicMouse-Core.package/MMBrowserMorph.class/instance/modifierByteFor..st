-> to chrome
modifierByteFor: anEvent
	"Pack the event's active modifier keys into a single byte for the wire.
	bit0 = Ctrl, bit1 = Alt (option), bit2 = Shift, bit3 = Cmd. run.js turns
	these into puppeteer keyboard modifiers held around the mouse/key action."

	| bits |
	bits := 0.
	anEvent controlKeyPressed ifTrue: [bits := bits bitOr: 1].
	anEvent optionKeyPressed ifTrue: [bits := bits bitOr: 2].
	anEvent shiftPressed ifTrue: [bits := bits bitOr: 4].
	anEvent commandKeyPressed ifTrue: [bits := bits bitOr: 8].
	^ bits