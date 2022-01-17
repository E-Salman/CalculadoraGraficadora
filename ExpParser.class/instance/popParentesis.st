parsing
popParentesis
	"Llamado despues de encontrar un parentesis cerrado. Recorre tkStack hasta encontrar una apertura de parentesis, llama a pushOutput: para cada token que no sea la apertura."
	|whileTemp parEncontrado|
	whileTemp := tkStack size.
	parEncontrado := false.
	
	[ whileTemp = 0 | parEncontrado ]
		whileFalse: 
		[ 
		parEncontrado := (tkStack at: whileTemp) = $(.
			parEncontrado
			ifFalse: 
				[ self pushOutput: (tkStack at: whileTemp) ].
			tkStack removeAt: tkStack size.
			whileTemp := whileTemp - 1 
		].
	
	"Si no se encuentra el par para el parentesis cerrado, se envia una advertencia para denotar el error."
	(parEncontrado)
	ifFalse:
		[ InputError new signal: 'Parentesis mal balanceados, verifique la expresión ingresada' ]