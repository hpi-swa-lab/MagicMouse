connecting
connect: aUrl

	| path arguments |
	process := MMProcessWrapper newForOS.
	self class debugEnabled ifTrue: [process enableDebug].
	arguments := {
		aUrl.
		viewportSize x.
		viewportSize y.
		self class runChromeHeadless ifTrue: ['headless'] ifFalse: ['windowed'].
		self class chromeProfilePath}.
	self class doNotUsePrebuiltBinary
		ifTrue: [
			self assertNodeScriptExists.
			path := self class gitRepositoryPath, FileDirectory slash, 'run.js'.
			process
				startNodeScript: path
				arguments: arguments
				nodeArguments: (self class debugNodejs ifTrue: [{'--inspect'}] ifFalse: [{}])]
		ifFalse: [
			path := (FileDirectory default / MMPluginDownloader filenameForCurrentPlatform) fullName.
			process startCommand: path withArguments: arguments].
	
	location := aUrl.
	self startReaderLoop