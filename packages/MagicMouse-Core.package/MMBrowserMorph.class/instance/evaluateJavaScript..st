javascript
evaluateJavaScript: aJavaScriptString
	"Fire-and-forget: evaluate aJavaScriptString in the page, ignoring the
	result. Never blocks. For the result, use evaluateJavaScript:do:."

	self
		evaluateJavaScript: aJavaScriptString
		do: [:result | ]
		onError: [:message | ]