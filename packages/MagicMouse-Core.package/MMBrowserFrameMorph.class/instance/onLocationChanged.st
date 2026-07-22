connecting
onLocationChanged
	"The page navigated: refresh the URL field and re-apply zoom (a fresh
	document resets the inline zoom style)."

	self updateUrlField.
	self zoom = 100 ifFalse: [self applyZoom]