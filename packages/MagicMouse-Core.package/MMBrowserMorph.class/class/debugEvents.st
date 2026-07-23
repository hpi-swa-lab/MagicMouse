preferences
debugEvents
	<preference: 'Debug input events to Transcript' category: 'MagicMouse' description: 'Print mouse and keyboard event routing to the Transcript (for diagnosing input handling)' type: #Boolean>

	^ DebugEvents ifNil: [false]