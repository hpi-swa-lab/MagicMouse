toolbar
urlFieldText
	^ (browser ifNil: [''] ifNotNil: [browser location ifNil: ['']]) asText