verificacion
verificarEvaluacion
	"Realiza algunas verificaciones generales en los datos ingresados por el usuario relacionados a la operacion de graficar en un intervalo. Tira un InputError si encuentra algun error."
	|charTemp conteoPuntos|
	
	"conteoPuntos se usa para contar la cantidad de puntos decimales en una ecuacion para detectar errores, si tiene mas de 1, se producira un error, ya que es un numero invalido."
	conteoPuntos := 0.
	"Si la expresion no incluye a $x, entonces no es necesario llenar textMorphEvalX, y se deja resolver la operacion."
	((textMorphEvalX contents = '') & (textMorphExpresion contents includes: $x))	
	ifTrue:
		[ InputError new signal: 'Debe ingresar un valor para X antes de poder evaluar la expresion' ]
	ifFalse:
		[
		1 to: textMorphEvalX contents size do: [ :forTemp |
			charTemp := (textMorphEvalX contents at: forTemp).
			(charTemp = $.)
			ifTrue:
				[ conteoPuntos := conteoPuntos + 1 ].
			"$- solo se acepta para señalizar numeros negativos, asi que tiene que estar en la primera posicion."
			((ExpParser esNumero: charTemp) | ((charTemp = $-) & (forTemp = 1)))
			ifFalse:
				[ InputError new signal: 'Ingresó un caracter invalido para X' ]
			].
				
		[ textMorphEvalX contents asNumber ]
		on: Error do: [ InputError new signal: 'Ingresó un caracter invalido para X' ].
		].	
	(conteoPuntos > 1)
	ifTrue:
		[ InputError new signal: 'Ingresó un numero invalido para X' ].