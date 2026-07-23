events
filterKeyboardEvent: anEvent
	"Only act when I hold the keyboard focus (pointer/click is on the page).
	Handle Ctrl+C locally; let every other key pass through to my #keyStroke:,
	which forwards it to Chrome."

	(self activeHand notNil and: [self activeHand keyboardFocus == self])
		ifFalse: [^ anEvent].
	anEvent isKeystroke ifFalse: [^ anEvent].
	(anEvent controlKeyPressed and: [
		anEvent keyValue = 3 "ETX: control folds C to 3 on some VMs"
			or: [anEvent keyCharacter asLowercase = $c]])
		ifTrue: [
			self copySelection.
			^ anEvent ignore].
	^ anEvent