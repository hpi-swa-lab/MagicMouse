evaluating
evaluateJavaScript: aString
	"Send aString to the connected browser page and print the result (or error)
	to the console pane."

	| js |
	js := aString withBlanksTrimmed.
	js isEmpty ifTrue: [^ self].
	browser ifNil: [^ self appendConsole: 'No browser connected.' level: 3].
	browser isConnected ifFalse: [^ self appendConsole: 'Browser is disconnected.' level: 3].
	self appendConsole: '> ', js level: 1.
	browser
		evaluateJavaScript: js
		do: [:result | self appendConsole: result level: 0]
		onError: [:message | self appendConsole: message level: 3]