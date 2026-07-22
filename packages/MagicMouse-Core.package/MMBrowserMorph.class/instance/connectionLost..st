connecting
connectionLost: aMessageString
	"The connection to Chrome ended (death or timeout). Tear down the process
	quietly, keep the last rendered image, and mark ourselves disconnected.
	Reconnect is offered via the frame's window menu. Runs in the reader
	process, so keep it short."

	Transcript showln: 'MMBrowser connection lost: ', (aMessageString ifNil: ['(unknown)']).
	process ifNotNil: [:p | [p terminate] on: Error do: [:e |]].
	process := nil.
	imageUpdaterProcess := nil.
	self changed