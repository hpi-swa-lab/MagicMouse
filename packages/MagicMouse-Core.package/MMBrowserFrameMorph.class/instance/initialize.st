initialization
initialize
	super initialize.
	toolbarVisible := false.
	self color: Color white.
	self changeTableLayout.
	self listDirection: #topToBottom.
	self hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	self layoutInset: 0; cellInset: 0.
	self initToolbar.
	browser := MMBrowserMorph new.
	browser hResizing: #spaceFill; vResizing: #spaceFill.
	browser when: #locationChanged send: #onLocationChanged to: self.
	self addMorphBack: browser.
	self updateToolbarVisibility