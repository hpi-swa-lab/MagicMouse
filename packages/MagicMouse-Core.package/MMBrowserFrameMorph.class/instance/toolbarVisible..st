toolbar
toolbarVisible: aBoolean
	toolbarVisible := aBoolean.
	self updateToolbarVisibility.
	aBoolean ifTrue: [self updateUrlField]