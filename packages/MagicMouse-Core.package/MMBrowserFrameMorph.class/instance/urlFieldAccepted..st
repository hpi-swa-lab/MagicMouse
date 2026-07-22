toolbar
urlFieldAccepted: aText
	"Enter in the URL field: navigate. A bare term (no scheme, no dot) searches."

	| s |
	s := aText asString withBlanksTrimmed.
	s isEmpty ifTrue: [^ true].
	((s includesSubstring: '://') or: [s includesSubstring: '.'])
		ifTrue: [browser changeLocation: ((s includesSubstring: '://') ifTrue: [s] ifFalse: ['https://', s])]
		ifFalse: [browser searchFor: s].
	^ true