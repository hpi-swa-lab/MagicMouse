zoom
applyZoom
	"Push the current zoom into the page. Re-applied after navigation since a
	fresh document resets inline styles."

	browser ifNil: [^ self].
	browser evaluateJavaScript:
		'document.documentElement.style.zoom = ', (self zoom / 100) printString