aplicacion
resolverOperacion
	"Refinamiento de resolverOperacion de Nodo, hace la operacion factorial con izquierda como argumento."
	|resultado hijoTemp|
	hijoTemp := hijo resolverOperacion.
	resultado := ((hijoTemp isInteger) & (hijoTemp positive))
	ifTrue:
		[ hijoTemp factorial ]
	ifFalse:
		[
		"Aproximacion matematica para conseguir el factorial de numeros fraccionarios y negativos fraccionarios."
		(((30 factorial) * (30 raisedTo: hijoTemp)) / ((hijoTemp + 1) * (hijoTemp + 2) * (hijoTemp + 3) * (hijoTemp + 4) * (hijoTemp + 5) * (hijoTemp + 6) * (hijoTemp + 7) * (hijoTemp + 8) * (hijoTemp + 9) * (hijoTemp + 10) * (hijoTemp + 11) * (hijoTemp + 12) * (hijoTemp + 13) * (hijoTemp + 14) * (hijoTemp + 15) * (hijoTemp + 16) * (hijoTemp + 17) * (hijoTemp + 18) * (hijoTemp + 19) * (hijoTemp + 20) * (hijoTemp + 21) * (hijoTemp + 22) * (hijoTemp + 23) * (hijoTemp + 24) * (hijoTemp + 25) * (hijoTemp + 26) * (hijoTemp + 27) * (hijoTemp + 28) * (hijoTemp + 29) * (hijoTemp + 30)))
		].
	^resultado