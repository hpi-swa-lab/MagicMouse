initialization
initialize
	super initialize.
	consoleText := Text new.
	consoleMorph := PluggableTextMorph on: self text: #consoleText accept: nil.
	consoleMorph lock.
	inputMorph := PluggableTextMorph on: self text: #inputText accept: #acceptInput:.
	self appendConsole: 'MagicMouse DevTools -- select JS and press Cmd+D to evaluate.' level: 1