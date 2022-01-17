graficador
agregarLineasHorizontales
	"Agrega las lineas horizontales de la grilla y la escala del eje Y."
	|tempPosicionY tempEscala|
	
	"Agrega la linea del eje X"
	grilla addMorph: (LineMorph new vertices:
		{(grilla left @ grilla center y).
		(grilla right @ grilla center y)}
		color: Color black
		borderWidth: 2
		borderColor: Color black).
	
	
	tempPosicionY := grilla center y - separacionGrilla.
	tempEscala := 1.
	[ grilla top < tempPosicionY ]
	whileTrue: 
		[
		"Agrega las lineas horizontales por arriba del eje X con una separacion igual a separacionGrilla."
		grilla addMorph: (LineMorph new vertices:
			{(grilla left @ tempPosicionY).
			(grilla right @ tempPosicionY)}
			color: Color black
			borderWidth: 1
			borderColor: Color black).
		
		"Agrega la escala numerica de los numeros positivos del eje Y."
		grilla addMorph: ((tempEscala asMorph)
			color: Color black; 
			position: ((grilla center x + 5) @ tempPosicionY)).
		tempEscala := tempEscala + 1.
		tempPosicionY := tempPosicionY - separacionGrilla
		].
	
	tempPosicionY := grilla center y + separacionGrilla.
	tempEscala := -1.
	[ grilla bottom > tempPosicionY ]
	whileTrue: 
		[
		"Agrega las lineas horizontales por debajo del eje X con una separacion igual a separacionGrilla."
		grilla addMorph: (LineMorph new vertices:
			{(grilla left @ tempPosicionY).
			(grilla right @ tempPosicionY)}
			color: Color black
			borderWidth: 1
			borderColor: Color black).
		
		"Agrega la escala numerica de los numeros negativos del eje Y."
		grilla addMorph: ((tempEscala asMorph) 
			color: Color black;
			position: ((grilla center x + 5) @ tempPosicionY)).
		tempEscala := tempEscala - 1.
		tempPosicionY := tempPosicionY + separacionGrilla 
		]