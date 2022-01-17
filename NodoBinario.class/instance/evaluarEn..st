aplicacion
evaluarEn: numero
	"Reemplaza $x con el numero recibido en todo el arbol de Nodos luego llama a resolverOperacion para entregar el resultado."
	izquierda evaluarEn: numero.
	derecha evaluarEn: numero.
	^self resolverOperacion.
	