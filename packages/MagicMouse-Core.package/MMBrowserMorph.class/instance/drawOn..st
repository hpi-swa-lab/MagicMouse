drawing
drawOn: aCanvas
	"Draw my background color to cover the areas when my viewport doesn't match my extent."

	aCanvas fillRectangle: self bounds color: self color.
	super drawOn: aCanvas.
	"Disconnected banner intentionally suppressed for now; drawReconnectOn:
	and the mouseDown: click-to-reconnect functionality are kept for later."
	"self isConnected ifFalse: [self drawReconnectOn: aCanvas]"