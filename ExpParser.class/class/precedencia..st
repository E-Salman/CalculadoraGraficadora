aplicacion
precedencia: token
	"Metodo utilitario. Recibe un token y devuelve un arreglo que representa la precedencia del token. En la primera posicion la precedencia del token, y en la segunda su asociatividad."
	|prec|
	prec := Array new: 2.
	((token = $+) | (token = $-))
	ifTrue: 
		[ 
		prec at: 1 put: 2.
		prec at: 2 put: $L 
		]
	ifFalse:
		[ 
		((token = $/) | (token = $*))
		ifTrue: 
			[ 
			prec at: 1 put: 3.
			prec at: 2 put: $L
			]
		ifFalse:
			[ 
			(token = $^)
			ifTrue: 
				[ 
				prec at: 1 put: 4.
				prec at: 2 put: $R 
				]
			ifFalse:
				[
				(token = $!)
				ifTrue: 
					[ 
					prec at: 1 put: 5.
					prec at: 2 put: $R 
					]
				ifFalse:
					[
					((token = $c) | (token = $t) | (token = $s) | (token = $r) | (token = $n))
					ifTrue: 
						[
						prec at: 1 put: 6.
						prec at: 2 put: $R
						]
					]
				]
			]
		].
	^prec