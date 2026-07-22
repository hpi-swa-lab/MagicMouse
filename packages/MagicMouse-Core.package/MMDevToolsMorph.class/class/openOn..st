instance creation
openOn: aMMBrowserMorph
	"Open a DevTools panel attached to the given browser morph."

	| dt window |
	dt := self new.
	dt browser: aMMBrowserMorph.
	window := SystemWindow labelled: 'MagicMouse DevTools'.
	window model: dt.
	window
		addMorph: dt consoleMorph
		frame: (0 @ 0 corner: 1 @ 0.7).
	window
		addMorph: dt inputMorph
		frame: (0 @ 0.7 corner: 1 @ 1).
	window openInWorldExtent: 600 @ 500.
	^ dt