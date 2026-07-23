javascript
copySelection
	"Read the page's current text selection and put it into the Squeak clipboard."

	self
		evaluateJavaScript: self selectionReaderJS
		do: [:result |
			result isEmptyOrNil
				ifTrue: [Transcript showln: 'MMBrowser: no selection to copy']
				ifFalse: [
					Clipboard clipboardText: result.
					Transcript showln: 'MMBrowser: copied ', result size printString, ' chars to clipboard']]