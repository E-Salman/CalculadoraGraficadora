aplicacion
resolverOperacion
	"Refinamiento de resolverOperacion de Nodo, hace la operacion de potencia con izquierda y derecha como argumentos."
	^((izquierda resolverOperacion) raisedTo: (derecha resolverOperacion))