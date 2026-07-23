initialization
outOfWorld: aWorld

	aWorld ifNotNil: [aWorld activeHand ifNotNil: [:hand |
		hand removeMouseCaptureFilter: self.
		hand removeKeyboardCaptureFilter: self]].
	super outOfWorld: aWorld.
	self dispose