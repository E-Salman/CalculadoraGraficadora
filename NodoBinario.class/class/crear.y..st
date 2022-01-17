constructor
crear: izq y: der
	|nodo|
	nodo := self new.
	nodo setIzq: izq.
	nodo setDer: der.
	^nodo.