verificacion
verificarIntervalo
	"Realiza algunas verificaciones generales en los datos ingresados por el usuario relacionados a la operacion de evaluar en x = . Tira un InputError si encuentra algun error."
	|charTemp errorPuntos conteoPuntos|	

	"conteoPuntos se usa para contar la cantidad de puntos decimales en una ecuacion para detectar errores, si tiene mas de 1, se producira un error, ya que es un numero invalido."
	conteoPuntos := 0.
	((textMorphIntervaloA contents = '') & (textMorphExpresion contents includes: $x))	
	ifTrue:
		[ InputError new signal: 'Debe ingresar un valor para el inicio del intervalo antes de poder graficar la expresion' ]
	ifFalse:
		[		
		1 to: textMorphIntervaloA contents size do: [ :forTemp |
			charTemp := (textMorphIntervaloA contents at: forTemp).
			(charTemp = $.)
			ifTrue:
				[ conteoPuntos := conteoPuntos + 1 ].
			"$- solo se acepta para señalizar numeros negativos, asi que tiene que estar en la primera posicion."
			((ExpParser esNumero: charTemp) | ((charTemp = $-) & (forTemp = 1)))
			ifFalse:
				[ InputError new signal: 'Ingresó un numero invalido como inicio del intervalo' ]
			]
		].
	(conteoPuntos > 1)
	ifTrue:
		[ InputError new signal: 'Ingresó un numero invalido como inicio del intervalo' ].
	
	conteoPuntos := 0.
	((textMorphIntervaloB contents = '') & (textMorphExpresion contents includes: $x))	
	ifTrue:
		[ InputError new signal: 'Debe ingresar un valor para el final del intervalo antes de poder graficar la expresion' ]
	ifFalse:
		[
		1 to: textMorphIntervaloB contents size do: [ :forTemp |
			charTemp := (textMorphIntervaloB contents at: forTemp).
			(charTemp = $.)
			ifTrue:
				[ conteoPuntos := conteoPuntos + 1 ].
			"$- solo se acepta para señalizar numeros negativos, asi que tiene que estar en la primera posicion."
			((ExpParser esNumero: charTemp) | ((charTemp = $-) & (forTemp = 1)))
			ifFalse:
				[ InputError new signal: 'Ingresó un numero invalido como final del intervalo' ] ].
		].
	(conteoPuntos > 1)
	ifTrue:
		[ InputError new signal: 'Ingresó un numero invalido como final del intervalo' ].

	conteoPuntos := 0.
	errorPuntos := false.
	((textMorphIntervaloN contents = '') & (textMorphExpresion contents includes: $x))	
	ifTrue:
		[ InputError new signal: 'Debe ingresar un valor para la cantidad de puntos que debe tener el intervalo antes de poder graficar la expresion' ]
	ifFalse:
		[
		1 to: textMorphIntervaloN contents size do: [ :forTemp |
			charTemp := (textMorphIntervaloN contents at: forTemp).
			(charTemp = $.)
			ifTrue:
				[ conteoPuntos := conteoPuntos + 1 ].
			(ExpParser esNumero: charTemp)
			ifFalse:
				[
				errorPuntos := true.			
				InputError new signal: 'Ingresó un numero invalido para la cantidad de puntos del intervalo'
				]
			 ]
		].
	(conteoPuntos > 1)
	ifTrue:
		[ InputError new signal: 'Ingresó un numero invalido para la cantidad de puntos intervalo' ].
	
	(errorPuntos)
	ifFalse:
		[
		((textMorphIntervaloN contents asNumber) < 2)
		ifTrue:
			[ InputError new signal: 'La cantidad de puntos de la funcion debe ser igual o mayor a 2' ]
		].
	[ textMorphIntervaloA contents asNumber ]
	on: Error do: [ InputError new signal: 'Ingresó un numero invalido para el inicio del intervalo' ].
	
	[ textMorphIntervaloB contents asNumber ]
	on: Error do: [ InputError new signal: 'Ingresó un numero invalido para el final del intervalo' ].
	
	[ textMorphIntervaloN contents asNumber ]
	on: Error do: [ InputError new signal: 'Ingresó un numero invalido para la cantidad de numeros del intervalo' ].