console
appendConsole: aString level: anInteger
	"Append a line to the console pane. anInteger is a severity level:
	0 log/result, 1 info/echo, 2 warn, 3 error, 4 debug, 5 pageerror.
	Color the text by level. Runs safely from any process."

	| color line |
	color := { Color black. Color gray: 0.4. Color orange. Color red. Color blue. Color red muchDarker }
		at: anInteger + 1
		ifAbsent: [Color black].
	line := (aString ifNil: ['nil']) , String cr.
	consoleText := self consoleText , (line asText addAttribute: (TextColor color: color)).
	WorldState addDeferredUIMessage: [
		consoleMorph ifNotNil: [
			consoleMorph setText: consoleText.
			consoleMorph textMorph editor selectAt: consoleText size + 1.
			consoleMorph scrollSelectionIntoView]]