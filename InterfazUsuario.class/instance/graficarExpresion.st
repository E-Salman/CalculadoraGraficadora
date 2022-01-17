botones
graficarExpresion
	"Este metodo se llama a traves del boton de 'Graficar'. Se encarga de llamar a los metodos necesarios para graficar la funcion para el intervalo ingresado."
	|errorEncontrado|
	errorEncontrado := false.
	
	"Se llama a verificarIntervalo: con la expresion trabajada. Se pasa cualquier error encontrado."
	[ self verificarIntervalo ]	
	on: Error do: [ :ex | errorEncontrado := true. ex pass ].
	
	"Si no se encontro ningun error en la expresion u otros campos requeridos, se prosigue con la ejecucion."
	(errorEncontrado)
	ifFalse:
		[
		"En caso de que ya haya creado una grafica previamente, se borra antes de crear una nueva."
		(grafica isNotNil)
		ifTrue:
			[ grafica delete ].
		"Se llama a Grafica nueva: con la expresion trabajada u el intervalo ingresado para crear la grafica."
		[ grafica := Grafica nueva: (textMorphExpresion contents) a: (textMorphIntervaloA contents asNumber) b: (textMorphIntervaloB contents asNumber) n: (textMorphIntervaloN contents asNumber) ]
	
	"En caso de que se produzca un error no salvable durante la operacion, se pasa un error."
	on: Error do: [ :ex | 
		(ex class = InputError)
		ifTrue: 
			[ ex pass. ]
		ifFalse:
			[ Error new signal: 'Error en la operación, verifique la expresión ingresada' ].
		].
	grafica title: textMorphExpresion contents.
	].