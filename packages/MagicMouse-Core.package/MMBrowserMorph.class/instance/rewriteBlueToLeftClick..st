events
rewriteBlueToLeftClick: anEvent
	"Return a copy of anEvent with the blue (third/meta) button bit cleared and
	the red (left) button bit set, preserving all modifier bits (so the command/
	Alt modifier survives and #modifierByteFor: still reports it). This stops
	PasteUpMorph's filter from reading it as a halo trigger while letting my
	#mouseDown: forward a normal left-click plus modifier to Chrome."

	| newButtons clicks |
	newButtons := (anEvent buttons bitClear: MouseButtonEvent blueButton)
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