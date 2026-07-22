-> to chrome
sendEvent: anEventType withBuffer: aBuffer

	"Ignore events sent while disconnected (e.g. mouse move over a dropped
	morph) instead of failing with a DNU on a nil process."
	self isConnected ifFalse: [^ self].
	self process
		stdinPutUint32: aBuffer size + 2;
		stdinPutChar: $e;
		stdinPutUint8: (self eventTypeCode: anEventType);
		stdinPutBuffer: aBuffer asByteArray