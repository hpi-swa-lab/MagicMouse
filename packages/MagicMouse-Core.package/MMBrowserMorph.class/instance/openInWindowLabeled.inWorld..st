initialization
openInWindowLabeled: aString inWorld: aWorld
	"Open in a SystemWindow and register myself as the window's model so the
	title-bar menu can be extended (see addModelItemsToWindowMenu:)."

	| window |
	window := super openInWindowLabeled: aString inWorld: aWorld.
	window model: self.
	^ window