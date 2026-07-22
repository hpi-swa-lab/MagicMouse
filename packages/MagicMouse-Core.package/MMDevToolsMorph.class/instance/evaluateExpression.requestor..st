evaluating
evaluateExpression: aStringOrText requestor: aRequestor
	"Called by the text editor on Cmd+D / Cmd+P with the current selection.
	Send it to Chrome as JavaScript instead of compiling Smalltalk, and echo
	the code and result into the console pane."

	self evaluateJavaScript: aStringOrText asString.
	^ nil