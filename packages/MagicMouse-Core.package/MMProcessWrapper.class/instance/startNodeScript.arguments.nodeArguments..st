starting
startNodeScript: aString arguments: arguments nodeArguments: nodeArguments

	| node |
	node := OSProcess isWindows
		ifTrue: ['node']
		ifFalse: [(PipeableOSProcess command: 'command -v node') 
			upToEndOfFile withBlanksTrimmed].
	self startCommand: node withArguments: nodeArguments, {aString. '--'}, arguments