connecting
startReaderLoop
	"Fork the process that reads Chrome's output and dispatches commands. If the
	stream errors (e.g. Chrome died, or 30s of silence), treat it as an expected
	disconnect: tear down quietly and let the morph offer a reconnect. Do NOT
	pop a debugger -- a lost connection is not a programmer error."

	imageUpdaterProcess := [
		[[ | length command payload |
			length := process stdoutNextUint32.
			payload := process stdoutNextBuffer: length.
			command := payload unsignedCharAt: 1.
			self logReader: 'recv cmd ', (String with: command), ' len ', length printString.
			command caseOf: {
				[$i] -> [self updateImage: payload].
				[$h] -> [self handlePortal: payload].
				[$l] -> [self locationUpdated: payload].
				[$s] -> [self handleStructuredData: payload].
				[$g] -> [self handleGitClone: payload].
				[$f] -> [self handleFormFields: payload].
				[$v] -> [self handleEvalResult: payload].
				[$p] -> ["heartbeat ping; keeps the stream alive, nothing to do"]}] repeat]
			on: Error
			do: [:e | self logReader: 'CONNECTION LOST: ', e messageText. self connectionLost: e messageText]] fork