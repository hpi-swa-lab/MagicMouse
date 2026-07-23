events
filterMouseEvent: anEvent
	"Rewrite an emulated Ctrl+Yellow mousedown over me into a real Right-button
	click so the World's meta menu does not swallow it and #mouseDown: sees a
	proper right-click. All other mouse events pass through untouched."

	(self isEventForMe: anEvent) ifFalse: [^ anEvent].
	anEvent isMove ifFalse: [
		self logEvent: ['FILTER ', anEvent type printString,
			' red=', anEvent redButtonPressed printString,
			' yellow=', anEvent yellowButtonPressed printString,
			' ctrl=', anEvent controlKeyPressed printString,
			' alt=', anEvent optionKeyPressed printString,
			' shift=', anEvent shiftPressed printString,
			' cmd=', anEvent commandKeyPressed printString,
			' blue=', anEvent blueButtonPressed printString,
			' mods=', (self modifierByteFor: anEvent) printString]].
	"Blue (meta/third) button down over me would pop a halo via PasteUpMorph's
	filter -- rewrite it to a plain left click (keeping modifiers) so the click
	reaches the page as an Alt/Cmd+left-click instead."
	(anEvent isMouseDown and: [anEvent blueButtonPressed])
		ifTrue: [^ self rewriteBlueToLeftClick: anEvent].
	"Emulated Ctrl+Yellow down -> real right click (avoids the meta menu)."
	(anEvent isMouseDown
		and: [anEvent yellowButtonPressed]
		and: [anEvent controlKeyPressed])
			ifTrue: [^ self rewriteToRightClick: anEvent].
	^ anEvent