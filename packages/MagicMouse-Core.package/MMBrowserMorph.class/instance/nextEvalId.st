javascript
nextEvalId
	"Answer a fresh request id for a JavaScript eval, wrapping within uint32."

	evalCounter := ((evalCounter ifNil: [0]) + 1) \\ 16r100000000.
	^ evalCounter