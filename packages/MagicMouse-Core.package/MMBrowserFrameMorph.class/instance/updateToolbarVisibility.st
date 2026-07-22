toolbar
updateToolbarVisibility
	"Add/remove the toolbar row from the layout and re-flow so the browser
	fills the remaining space (no overlap)."

	self toolbarVisible
		ifTrue: [toolbar owner isNil ifTrue: [self addMorphFront: toolbar]]
		ifFalse: [toolbar owner ifNotNil: [toolbar delete]].
	self layoutChanged