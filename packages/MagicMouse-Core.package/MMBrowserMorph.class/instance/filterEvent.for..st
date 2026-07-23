events
filterEvent: anEvent for: aTargetOrNil
	"Hand-level capture filter (registered in #intoWorld:). Runs BEFORE Morphic
	dispatch, so we can grab raw events the World would otherwise eat (meta-menu
	on ctrl+click, keyboard shortcuts, etc.). Everything we don't care about is
	returned unchanged.

	Keyboard: only when I hold the keyboard focus. Ctrl+C is handled locally
	(copy the page selection into the Squeak clipboard) and consumed via #ignore.

	Mouse: an emulated Ctrl+Yellow mousedown over me (this VM's Ctrl+click) is
	rewritten into a real Right (yellow) click so it reaches my #mouseDown: as a
	proper right-click instead of triggering the World's meta menu."

	anEvent isKeyboard ifTrue: [^ self filterKeyboardEvent: anEvent].
	anEvent isMouse ifTrue: [^ self filterMouseEvent: anEvent].
	^ anEvent