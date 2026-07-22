model
acceptInput: aText
	"Accept (Cmd+S) evaluates the whole input as JavaScript, like Cmd+D on all."

	self evaluateJavaScript: aText asString.
	^ true