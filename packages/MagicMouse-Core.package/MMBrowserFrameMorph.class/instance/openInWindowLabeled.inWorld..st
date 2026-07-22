initialization
openInWindowLabeled: aString inWorld: aWorld
	"Open in a SystemWindow and register myself as its model so the title-bar
	menu can be extended (see addModelItemsToWindowMenu:)."

	| window |
	window := super openInWindowLabeled: aString inWorld: aWorld.
	window model: self.
	"The browser pane is spaceFill and has no natural size, so the window's
	fullBounds-based guess collapses. Force our default size."
	window extent: self defaultExtent + (window extent - window layoutBounds extent).
	^ window