starting
startNodeScript: aString arguments: arguments nodeArguments: nodeArguments

	| node |
	node := OSProcess isWindows
		ifTrue: ['node']
		ifFalse: ['/home/jens/.nvm/versions/node/v22.14.0/bin/node'].
	self startCommand: node withArguments: nodeArguments, {aString. '--'}, arguments