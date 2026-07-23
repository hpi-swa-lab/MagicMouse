initialization
intoWorld: aWorld

	super intoWorld: aWorld.
	aWorld ifNotNil: [aWorld activeHand ifNotNil: [:hand |
		hand addMouseCaptureFilter: self.
		hand addKeyboardCaptureFilter: self]].
	self isConnected ifFalse: [self connect: self location]