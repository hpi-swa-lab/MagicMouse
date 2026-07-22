connecting
logReader: aString
	"Append a timestamped line to a Squeak-side reader logfile so we can debug
	the connection independently of the Transcript."

	[| f |
	f := FileStream fileNamed: '/tmp/mm-squeak.log'.
	f setToEnd; nextPutAll: DateAndTime now printString, ' ', aString; nl; close]
		on: Error do: [:e | ]