-> to chrome
baseKeyStringFrom: anEvent
	"Answer the base key of anEvent as a String, with any modifier prefix that
	Squeak's #keyString added stripped off. Plain keys come back bare ('a'),
	named keys keep their brackets ('<cr>', '<tab>', '<down>')."

	| ks inner parts |
	ks := anEvent keyString.
	(ks beginsWith: '<') ifFalse: [^ ks].
	inner := ks copyFrom: 2 to: ks size - 1.
	"inner is like 'Cmd-a' or 'Ctrl-Shift-cr' or just 'cr'. Drop leading
	modifier tokens (Cmd/Ctrl/Alt/Shift), keep the rest as the base."
	parts := inner findTokens: '-'.
	[parts size > 1 and: [#('Cmd' 'Ctrl' 'Alt' 'Opt' 'Shift' 'Meta') includes: parts first]]
		whileTrue: [parts := parts allButFirst].
	"Rejoin remaining (a key name could contain no dashes now)."
	inner := parts inject: '' into: [:acc :tok | acc isEmpty ifTrue: [tok] ifFalse: [acc, '-', tok]].
	"Single char -> bare; multi-char named key -> re-bracket."
	^ inner size = 1 ifTrue: [inner] ifFalse: ['<', inner, '>']