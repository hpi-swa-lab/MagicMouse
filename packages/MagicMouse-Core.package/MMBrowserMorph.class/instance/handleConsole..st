javascript
handleConsole: payload
	"Chrome forwarded a page console message. Layout after the leading $c:
	uint8 level (0 log, 1 info, 2 warn, 3 error, 4 debug, 5 pageerror), then
	uint32 length, utf8 text. Trigger #consoleMessage with an Association
	level -> text so DevTools panels can display it."

	| level length text |
	level := payload at: 2.
	length := payload unsignedLongAt: 3.
	text := (payload copyFrom: 7 to: 7 + length - 1) asString utf8ToSqueak.
	self triggerEvent: #consoleMessage with: level -> text