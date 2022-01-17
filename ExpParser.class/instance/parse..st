parsing
parse: nuevaExpresion
	"Recibe la expresion y devuelve una estructura de Nodo lista para resolver."
	|exprTemp tamañoExp charEvaluado|
	exprTemp := String new.
	tamañoExp := nuevaExpresion size.
	
	"For loop que recorre la expresion recibida.|" 
	1 to: tamañoExp do:
	[ :forTemp |
		charEvaluado := nuevaExpresion at: forTemp.
		(self class esNumero: (charEvaluado))		
		ifTrue: 
			[
			(charEvaluado = $x)
			ifTrue: 
				"Si charEvaluado es $x, signfica que no es necesario el uso de exprTemp, por lo que se manda directamente al output con pushOutput:"
				[ self pushOutput: charEvaluado ]
			ifFalse:
				"Si charEvaluado es un numero y no x, se agrega a exprTemp en el caso que el numero completo tome mas de un caracter en expresar."
				[ exprTemp := exprTemp, (charEvaluado) asString ]
			]
		ifFalse:
			[ 
			"Si charEvaluado no es un numero, entonces es un token."
			(exprTemp = '')
			ifFalse: 
				[
				"Si exprTemp no esta vacio, se envia el numero guardado en el al stack con pushOutput: y se vacia exprTemp"
				self pushOutput: exprTemp.
				exprTemp := ''.
				].
			"Si charEvaluado es una apertura de parentesis, se agrega directamente a tkStack."
			((charEvaluado) = $()
			ifTrue:
				[ tkStack add: charEvaluado ]
			ifFalse:
				[
				"Si charEvaluado cierra el parentesis, se llama a popParentesis para buscar la apertura."
				((charEvaluado) = $))
				ifTrue:
					[ self popParentesis ]
				"Si ninguna de las condiciones anteriores se cumplieron, el token es una operacion, asi que se evalua llamando a evaluarToken:"
				ifFalse:
					[ self evaluarToken: charEvaluado ]
				]
			]
		]. 
	
	"Si exprTemp estaba guardando un numero despues que se termino el recorrido, se llama a pushOutup:"
	(exprTemp ~= '')
	ifTrue: 
		[ self pushOutput: exprTemp ].
	
	"Si tkStack no esta vacio despues del recorrido, se llama a pushOutput: con cada token que quede."
	[ tkStack isNotEmpty ]
	whileTrue:
		[ 
		self pushOutput: tkStack last.
		tkStack removeAt: tkStack size.
		].	
	^output last