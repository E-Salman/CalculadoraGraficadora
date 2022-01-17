botones
evaluarX
	"Este metodo se llama a traves del boton de 'Evaluar para x = '. Se encarga de llamar a los metodos necesarios para evaluar la funcion para el x ingresado."
	|errorEncontrado|
	errorEncontrado := false.
	
	"Se llama a verificarEvaluacion: con la expresion trabajada. Se pasa cualquier error encontrado."
	[ self verificarEvaluacion ]
	on: Error do: [ :ex | errorEncontrado := true. ex pass ].
	
	"Si no se encontro ningun error en la expresion u otros campos requeridos, se prosigue con la ejecucion."
	(errorEncontrado)
	ifFalse:
		[
		"Se llama a ExpParser parseExp: con la expresion trabajada reemplazando a $x con los contenidos de textMorphEvalX y se pone el resultado en lblResultado."
		[ lblResultado acceptValue: 
			((ExpParser parseExp: (textMorphExpresion contents)) 
				evaluarEn: (textMorphEvalX contents asNumber)) ]
		"Devuelve un error si se encontro uno durante la operacion."
		on: Error do: [ :ex | 
			ex class = InputError 
			ifTrue: 
				[ ex pass ]
			ifFalse:
				[ Error new signal: 'Error en la operación, verifique la expresión ingresada' ] 
			]
		]