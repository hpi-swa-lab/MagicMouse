-> to chrome
keyStringWithAllModifiers: anEvent
	"Build a wire keyString that carries ALL active modifiers, including Alt,
	which Squeak's own #keyString drops. Format matches what run.js parses:
	optional <Cmd-/<Ctrl-/<Alt-/<Shift- prefixes, then the base key.

	The base key is taken from the event's own #keyString with any modifier
	prefix stripped, so named keys (<cr>, <tab>, arrows) keep their <...> form."

	| base prefix |
	base := self baseKeyStringFrom: anEvent.
	prefix := String streamContents: [:s |
		anEvent commandKeyPressed ifTrue: [s nextPutAll: 'Cmd-'].
		anEvent controlKeyPressed ifTrue: [s nextPutAll: 'Ctrl-'].
		anEvent optionKeyPressed ifTrue: [s nextPutAll: 'Alt-'].
		anEvent shiftPressed ifTrue: [s nextPutAll: 'Shift-']].
	prefix isEmpty ifTrue: [^ base].
	"Wrap as <mods-key>. If base is already <named>, fold into one bracket."
	(base beginsWith: '<')
		ifTrue: [^ '<', prefix, (base allButFirst)]
		ifFalse: [^ '<', prefix, base, '>']