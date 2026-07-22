javascript
pendingEvals
	"Dictionary mapping a request id to a pending-eval holder. Lazily created."

	^ pendingEvals ifNil: [pendingEvals := Dictionary new]