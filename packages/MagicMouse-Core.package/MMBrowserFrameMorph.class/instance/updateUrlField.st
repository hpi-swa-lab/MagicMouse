toolbar
updateUrlField
	"Refresh the URL field from the browser location, unless it has focus."

	urlField ifNil: [^ self].
	urlField hasKeyboardFocus ifTrue: [^ self].
	urlField setText: (browser ifNil: [''] ifNotNil: [browser location ifNil: ['']]) asText