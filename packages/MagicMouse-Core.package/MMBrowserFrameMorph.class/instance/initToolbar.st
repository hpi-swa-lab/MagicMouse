initialization
initToolbar
	"Build the navigation toolbar row: Back / Forward / Reload + URL field."

	| back fwd reload font rowHeight |
	font := TextStyle defaultFont.
	rowHeight := font height + 6.
	toolbar := Morph new
		color: (Color gray: 0.9);
		borderWidth: 0;
		yourself.
	toolbar changeTableLayout.
	toolbar listDirection: #leftToRight; hResizing: #spaceFill; vResizing: #shrinkWrap;
		cellInset: 2; layoutInset: 1; cellPositioning: #center.

	back := self toolbarButton: '<' action: #goBack help: 'Back' font: font height: rowHeight.
	fwd := self toolbarButton: '>' action: #goForward help: 'Forward' font: font height: rowHeight.
	reload := self toolbarButton: 'R' action: #doRefresh help: 'Reload' font: font height: rowHeight.

	urlField := PluggableTextMorph on: self text: #urlFieldText accept: #urlFieldAccepted:.
	urlField hResizing: #spaceFill; vResizing: #rigid; height: rowHeight; acceptOnCR: true.
	urlField font: font.

	toolbar addMorphBack: back; addMorphBack: fwd; addMorphBack: reload; addMorphBack: urlField