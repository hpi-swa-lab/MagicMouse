drawing
drawReconnectOn: aCanvas
	"Overlay a centered 'Disconnected -- click to reconnect' banner when the
	connection is down. The whole morph is clickable to reconnect (see
	mouseDown:); this is just the visual affordance."

	| label font labelExtent boxExtent boxOrigin |
	aCanvas fillRectangle: self bounds color: (Color black alpha: 0.35).
	label := 'Disconnected -- click to reconnect'.
	font := TextStyle defaultFont.
	labelExtent := (font widthOfString: label) @ font height.
	boxExtent := labelExtent + (24 @ 16).
	boxOrigin := self bounds center - (boxExtent // 2).
	aCanvas
		fillRectangle: (boxOrigin extent: boxExtent)
		color: (Color r: 0.15 g: 0.15 b: 0.2).
	aCanvas
		frameRectangle: (boxOrigin extent: boxExtent)
		width: 1
		color: Color white.
	aCanvas
		drawString: label
		at: boxOrigin + (12 @ 8)
		font: font
		color: Color white