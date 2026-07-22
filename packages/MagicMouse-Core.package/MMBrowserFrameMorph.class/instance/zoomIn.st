zoom
zoomIn
	"Advance to the next discrete zoom step above the current level."

	self zoom: (self zoomSteps detect: [:s | s > self zoom] ifNone: [self zoomSteps last])