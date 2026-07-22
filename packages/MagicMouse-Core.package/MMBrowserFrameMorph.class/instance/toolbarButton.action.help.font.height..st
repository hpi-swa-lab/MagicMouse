initialization
toolbarButton: aLabel action: aSelector help: helpString font: aFont height: rowHeight
	"Build a compact toolbar button."

	| b |
	b := SimpleButtonMorph new.
	b
		target: self;
		actionSelector: aSelector;
		setBalloonText: helpString;
		label: aLabel font: aFont;
		vResizing: #rigid;
		height: rowHeight;
		borderWidth: 1.
	^ b