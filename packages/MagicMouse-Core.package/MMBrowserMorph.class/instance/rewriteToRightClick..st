events
rewriteToRightClick: anEvent
	"Return a copy of anEvent (an emulated Ctrl+Yellow mousedown) with the yellow
	button bit cleared and the red button bit set, keeping every modifier so the
	event dispatches as a plain left-ish button while my #mouseDown: still reads
	yellowButtonChanged. Mirrors SWAMarksListMorph>>rewriteToControlRedClick:."

	| newButtons clicks |
	newButtons := (anEvent buttons bitClear: MouseButtonEvent yellowButton)
		bitOr: MouseButtonEvent redButton.
	clicks := (anEvent respondsTo: #nClicks) ifTrue: [anEvent nClicks] ifFalse: [1].
	^ MouseButtonEvent new
		setType: anEvent type
		position: anEvent position
		which: MouseButtonEvent redButton
		buttons: newButtons
		nClicks: clicks
		hand: anEvent hand
		stamp: anEvent timeStamp