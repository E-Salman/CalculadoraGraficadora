parsing
pushOutput: toOutput
	"Agrega a toOutput a output.
	(toOutput isNumber)
	ifTrue: 
		Si toOutput es un numero, se agrega a output asi como esta.
		[ output add: toOutput ]"
	(toOutput = $x)
	ifTrue:
		[ output add: (NodoNumero crear: toOutput) ]
	ifFalse:
		[
		(toOutput isString)
		ifTrue:
			"Si toOutput es un String, signfica que viene de exprTemp, por lo que es un numero, asi que se hace la conversion a numero y se agrega a output."
			[ output add: (NodoNumero crear: (toOutput asNumber)) ]
		ifFalse:
			"Si toOutput no es un numero, es un token, entonces se llama a a crearNodos: para crear un Nodo de operacion basado en toOutput y agregarlo a output."
			[ self crearNodos: toOutput ] 
		]