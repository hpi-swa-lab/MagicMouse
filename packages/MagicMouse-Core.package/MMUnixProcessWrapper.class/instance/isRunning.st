testing
isRunning
	"Answer whether the underlying OS process is still alive."

	^ process notNil and: [process isRunning]