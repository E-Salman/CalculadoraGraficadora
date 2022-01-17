aplicacion
crearNodos: token
	"Crea un nuevo nodo de operacion con el constructor crear:, lo agrega al output, y lo entrelaza con los ya existentes. El tipo de operacion depende del token recibido y sus operandos pueden ser uno o mas tomados de las ultimas posiciones de output"
	|nodo tamStack|
	tamStack := output size.
	
	(token = $+)
	ifTrue:
		[
		nodo := NodoSuma crear: (output at: tamStack - 1) y: (output at: (tamStack)).
		output removeAt: tamStack
		]
	ifFalse:
		[ 
		(token = $-)
		ifTrue:
			[
			nodo := NodoResta crear: (output at: tamStack - 1) y: (output at: (tamStack)).
			output removeAt: tamStack				
			]
		ifFalse: 
			[ 
			(token = $*)
			ifTrue:
				[
				nodo := NodoFactor crear: (output at: tamStack - 1) y: (output at: (tamStack)).
				output removeAt: tamStack			
				]
			ifFalse:
				[ 
				(token = $/)
				ifTrue:
					[
					nodo := NodoDivision crear: (output at: tamStack - 1) y: (output at: (tamStack)).
					output removeAt: tamStack				
					]
				ifFalse:
					[
					(token = $^)
					ifTrue: 
						[
						nodo := NodoPotencia crear: (output at: tamStack - 1) y: (output at: (tamStack)).
						output removeAt: tamStack
						]
					ifFalse:
						[
						(token = $r)
						ifTrue: 
							[ nodo := NodoRaiz crear: (output at: tamStack) ]	
						ifFalse:
							[
							(token = $s)
							ifTrue: 	
								[ nodo := NodoSeno crear: (output at: tamStack) ]
								ifFalse:
									[							
									(token = $c)
									ifTrue: 	
										[ nodo := NodoCoseno crear: (output at: tamStack) ]
									ifFalse:
										[ 						
										(token = $t)
										ifTrue:
										[ nodo := NodoTangente crear: (output at: tamStack) ]
										ifFalse:
											[ 
											(token = $!)
											ifTrue: 
											[ nodo := NodoFactorial crear: (output at: tamStack) ]
											ifFalse:
												[
												(token = $n)
												ifTrue:
													[ nodo := NodoFactor crear: (output at: tamStack) y: (NodoNumero crear: -1) ]
											]
										]
									]
								]
							]
						]
					]
				]
			]
		].
	"Se remueve el ultimo numero de output, porque se uso para la creacion del nuevo nodo. Si el Nodo creado requirio de mas de un numero, el mismo se remueve antes de llegar a este punto, despues de la creacion del Nodo."
	output removeAt: output size.
	"Añade el nodo recientemente creado a output."
	output add: nodo.