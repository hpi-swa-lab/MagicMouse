menu
addModelItemsToWindowMenu: aMenu
	"Extend the SystemWindow title-bar menu with MagicMouse actions."

	aMenu addLine.
	aMenu
		add: 'copy selection' translated
		target: self
		selector: #copySelection.
	aMenu
		add: 'DevTools' translated
		target: self
		selector: #openDevTools.
	aMenu
		add: 'reconnect' translated
		target: self
		selector: #reconnect