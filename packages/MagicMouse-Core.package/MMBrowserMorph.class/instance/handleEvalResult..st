javascript
handleEvalResult: payload
	"Chrome answered a JavaScript eval request. Layout after the leading $v:
	uint32 requestId, uint8 ok (1 = value, 0 = error), uint32 length, utf8 string.
	Store the result in the matching holder and signal its semaphore."

	| requestId ok length string callbacks |
	requestId := payload unsignedLongAt: 2.
	ok := payload at: 6.
	length := payload unsignedLongAt: 7.
	string := (payload copyFrom: 11 to: 11 + length - 1) asString utf8ToSqueak.
	callbacks := self pendingEvals removeKey: requestId ifAbsent: [^ self].
	"callbacks is { resultBlock. errorBlock }. Evaluate on the caller's behalf.
	Guard so a broken callback cannot kill the reader process."
	[ok = 0
		ifTrue: [(callbacks at: 2) value: string]
		ifFalse: [(callbacks at: 1) value: string]]
		on: Error
		do: [:e | Transcript showln: 'MMBrowser eval callback error: ', e messageText]