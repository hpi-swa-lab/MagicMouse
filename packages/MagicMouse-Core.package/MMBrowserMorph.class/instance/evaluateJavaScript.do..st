javascript
evaluateJavaScript: aJavaScriptString do: aResultBlock
	"Evaluate aJavaScriptString in the page without blocking; call aResultBlock
	with the result String when it arrives. JS errors are printed to Transcript.
	See evaluateJavaScript:do:onError: to handle errors yourself."

	^ self
		evaluateJavaScript: aJavaScriptString
		do: aResultBlock
		onError: [:message | Transcript showln: 'MMBrowser JS error: ', message]