aplicacion
esToken: char
	"Metodo utilitario. Verifica si char es un token aceptado por la calculadora. Para eso, verifica si la coleccion de tokens inluye a char"
	^(tokens includes: char)