accessing
isConnected

	"Connected means we have a process wrapper whose OS process is still alive.
	Checking liveness (not just non-nil) lets us detect a dead browser promptly,
	before the 30s read timeout fires, so the reconnect affordance appears fast."

	^ process notNil
		and: [(process respondsTo: #isRunning)
			ifTrue: [process isRunning]
			ifFalse: [true]]