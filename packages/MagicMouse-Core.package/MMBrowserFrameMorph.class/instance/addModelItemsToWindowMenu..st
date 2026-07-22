menu
addModelItemsToWindowMenu: aMenu
	"Extend the SystemWindow title-bar menu."

	aMenu addLine.
	aMenu add: 'DevTools' translated target: self selector: #openDevTools.
	aMenu addUpdating: #toolbarMenuLabel target: self selector: #toggleToolbar argumentList: #().
	aMenu addLine.
	aMenu add: 'Zoom in' translated target: self selector: #zoomIn.
	aMenu add: 'Zoom out' translated target: self selector: #zoomOut.
	aMenu addUpdating: #zoomResetLabel target: self selector: #zoomReset argumentList: #().
	aMenu addLine.
	aMenu add: 'reconnect' translated target: self selector: #reconnect