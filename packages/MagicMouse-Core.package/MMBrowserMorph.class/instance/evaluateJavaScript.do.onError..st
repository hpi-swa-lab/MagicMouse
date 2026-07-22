javascript
evaluateJavaScript: aJavaScriptString do: aResultBlock onError: anErrorBlock
	"Evaluate aJavaScriptString in the page WITHOUT blocking. When Chrome
	answers, aResultBlock is called with the result String (the JS value coerced
	via String(...), or 'undefined'). If the JS throws or times out in the
	browser, anErrorBlock is called with the error message String instead.
	Promises are awaited on the browser side, so async JS just works.

	The callback runs later, in the imageUpdater process that reads Chrome's
	output -- not in the caller's process. Answer the request id."

	| id idBytes |
	id := self nextEvalId.
	self pendingEvals at: id put: (Array with: aResultBlock with: anErrorBlock).
	idBytes := ByteArray new: 4.
	idBytes unsignedLongAt: 1 put: id.
	self sendCommand: $v withBuffer: idBytes, aJavaScriptString squeakToUtf8 asByteArray.
	^ id