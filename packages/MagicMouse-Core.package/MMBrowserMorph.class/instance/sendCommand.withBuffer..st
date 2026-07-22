-> to chrome
sendCommand: aCharacter withBuffer: aBuffer

	"Ignore commands sent while disconnected instead of failing with a DNU on a
	nil process. Callers (events, eval, navigation) may fire after a drop."
	self isConnected ifFalse: [^ self].
	self process
		stdinPutUint32: aBuffer size + 1;
		stdinPutChar: aCharacter;
		stdinPutBuffer: aBuffer asByteArray