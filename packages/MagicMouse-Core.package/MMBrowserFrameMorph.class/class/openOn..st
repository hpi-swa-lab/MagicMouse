instance creation
openOn: aUrl
	| frame |
	frame := self new.
	frame connect: aUrl.
	frame openInWindowLabeled: MMBrowserMorph title.
	^ frame