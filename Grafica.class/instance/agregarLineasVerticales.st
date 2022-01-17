graficador
agregarLineasVerticales
	"Agrega las lineas verticales de la grilla y la escala del eje Y."
	|tempPosicionX tempEscala|
		
	"Agrega la linea del eje X"
	grilla addMorph: (LineMorph new vertices: 
		{(grilla center x)@(grilla top). 
		(grilla center x)@(grilla bottom)} 
		color: Color black 
		borderWidth: 2 
		borderColor: Color black).
		
	tempPosicionX	:= grilla center x + separacionGrilla.	
	tempEscala := 1.
	[ grilla right > tempPosicionX ]
	whileTrue:
		[
		"Agrega las lineas verticales a la derecha del eje Y con una separacion igual a separacionGrilla."
		grilla addMorph: (LineMorph new vertices: 
			{tempPosicionX@grilla top.
			tempPosicionX@grilla bottom} 
			color: Color black
			borderWidth: 1
			borderColor: Color black).
		
		"Agrega la escala numerica de los numeros positivos del eje X."
		grilla addMorph: ((tempEscala asMorph)
			color: Color black; 
			position: (tempPosicionX @ grilla center y + 5)).
		tempEscala := tempEscala +1.
		tempPosicionX := tempPosicionX + separacionGrilla.
		].
	
	tempPosicionX := grilla center x - separacionGrilla.	
	tempEscala := -1.
	[ grilla left < tempPosicionX ]
	whileTrue:
		[
		"Agrega las lineas verticales a la izquierda del eje Y con una separacion igual a separacionGrilla."
		grilla addMorph: (LineMorph new vertices: 
			{tempPosicionX@grilla top.
			tempPosicionX@grilla bottom} 
			color: Color black 
			borderWidth: 1 borderColor: 
			Color black ).
		
		"Agrega la escala numerica de los numeros negativos del eje X."
		grilla addMorph: ((tempEscala asMorph)
			color: Color black; 
			position: (tempPosicionX @ grilla center y + 5)).
		tempEscala := tempEscala - 1.
		tempPosicionX := tempPosicionX - separacionGrilla.
		].	