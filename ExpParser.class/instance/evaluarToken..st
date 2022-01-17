parsing
evaluarToken: token
	"Evalua el token recibido para decidir que hacer con el, agregarlo en tkStack o llamar a pushOutput: para crear un nuevo Nodo. Esto se decide en base a su precedencia con respecto a otros tokens en tkStack"
	|whileTemp tkPrecedencia tkStackPrecedencia tokenEnStack|
	whileTemp := tkStack size.
	tkPrecedencia := self class precedencia: token.
	tokenEnStack := false.
	
	"Se recorre tkStack desde el ultimo token agregado, mientras whileTemp no sea 0, o se añada el token al stack, se continua el recorrido."
	[ whileTemp = 0 | tokenEnStack ]
	whileFalse:
		[
		"Si el token en tkStack es una apertura de parentesis, el token evaluado se agrega y se termina el recorrido."
		((tkStack at: whileTemp) = $()
		ifTrue: 
			[ 
			tkStack add: token.
			tokenEnStack := true 
			]
		ifFalse:
			[
			"Se usa el metodo de clase precedencia: para determinar la precedencia del ultimo token en el stack"
			tkStackPrecedencia := (self class precedencia: (tkStack at: whileTemp)).
			"Luego esta precedencia se compara con la precedencia del token evaluado. Si la precedencia del token evaluado es menor a la del token en el stack, o si es igual y el token evaluado tiene una asociatividad de izquierda, se cumple la condicion."
			(((tkPrecedencia at: 1) < (tkStackPrecedencia at: 1)) | 
				(((tkPrecedencia at: 1) = (tkStackPrecedencia at: 1)) & ((tkPrecedencia at: 2) = $L)))
			ifTrue:
				[ 
				"Si la condicion se cumple, se llama a pushOutput: para crear un nuevo Nodo con el ultimo tkStack y se remueve del stack."
				self pushOutput: (tkStack at: whileTemp).								
				tkStack removeAt: tkStack size.
				]		
			ifFalse:
				[	
				"Si la condicion no se cumple, se agrega el token a tkStack y se acaba el recorrido."
				tkStack add: token.
				tokenEnStack := true.						
				].
			].
		whileTemp := whileTemp - 1.	
		].
	
	"Si no se agrego el token a tkStack durante el recorrido por cualquier razon, se agrega aca"
	(tokenEnStack)
	ifFalse: 
		[ tkStack add: token. ]			