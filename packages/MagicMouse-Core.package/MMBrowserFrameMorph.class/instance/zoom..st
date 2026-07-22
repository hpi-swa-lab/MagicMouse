zoom
zoom: aPercent
	"Set the page zoom (percent) and apply it via CSS zoom on the document
	root. Clamped to a sane range. Note: CSS zoom reflows like Ctrl+/-, but
	vh/vw units do not rescale (Chrome has no live native-zoom API)."

	zoom := (aPercent max: 25) min: 500.
	self applyZoom