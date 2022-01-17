graficador
generarVertices: expresion a: comienzo b: final n: puntos
	"Crea un stack de puntos y lo llena con los x y el f(x) resultante de llamar a ExpParser parse: reemplazando x en la expresion con el valor correspondiente."
	|whileTemp separacionX|
	
	vertices := OrderedCollection new.
	separacionX := ((final - comienzo) / puntos).
	
	"Añade un punto al stack hasta llegar a la cantidad de puntos requerida."
	whileTemp := comienzo.
	[ whileTemp ~= final ]
	whileTrue:
		[
		"Se reemplaza x con el valor de whileTemp en la expresion y despues se llama a ExpParser parseExp:"
		[ [ [ vertices add: (whileTemp@((ExpParser parseExp: expresion) evaluarEn: whileTemp)) ]
			"En caso de que haya un error matematico, se saltea para ese x y se continua la ejecucion."
			on: ZeroDivide
			do: [ :ex | 
				whileTemp := whileTemp + separacionX. 
				ex retry ]
			]
		on: DomainError
		do: [ :ex | 
			whileTemp := whileTemp + separacionX.
			ex retry ].
		]
		on: ArithmeticError 
		do: [ :ex |
			whileTemp := whileTemp + separacionX.
			ex retry ].
		whileTemp := whileTemp + separacionX.
		].
	self graficarVertices.