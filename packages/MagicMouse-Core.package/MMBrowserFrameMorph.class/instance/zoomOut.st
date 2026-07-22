zoom
zoomOut
	"Drop to the next discrete zoom step below the current level."

	self zoom: (self zoomSteps reversed detect: [:s | s < self zoom] ifNone: [self zoomSteps first])