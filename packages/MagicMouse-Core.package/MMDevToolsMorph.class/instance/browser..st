accessing
browser: aMMBrowserMorph
	"Attach to a browser and subscribe to its page console stream."

	browser ifNotNil: [browser removeActionsWithReceiver: self].
	browser := aMMBrowserMorph.
	browser
		when: #consoleMessage
		send: #consoleMessage:
		to: self