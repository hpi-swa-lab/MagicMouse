connecting
reconnect
	"Re-establish the connection to Chrome using the last known location."

	self isConnected ifTrue: [^ self].
	self connect: (location ifNil: ['https://google.com'])