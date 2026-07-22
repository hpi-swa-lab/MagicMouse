menu
addModelItemsToWindowMenu: aMenu
	"Extend the SystemWindow title-bar menu."

	aMenu addLine.
	aMenu add: 'DevTools' translated target: self selector: #openDevTools.
	aMenu addUpdating: #toolbarMenuLabel target: self selector: #toggleToolbar argumentList: #().
	aMenu add: 'reconnect' translated target: self selector: #reconnect