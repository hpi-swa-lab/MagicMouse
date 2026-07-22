instance creation
openOn: aUrl

	| morph window |
	morph := self new connect: aUrl.
	window := morph openInWindowLabeled: self title.
	"Set the morph as the window's model so it can extend the title-bar menu
	(see MMBrowserMorph>>addModelItemsToWindowMenu:)."
	window model: morph.
	^ morph