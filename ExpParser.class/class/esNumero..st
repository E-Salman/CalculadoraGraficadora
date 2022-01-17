aplicacion
esNumero: char
	"Metodo utilitario. Verifica si char es numero aceptado por la calculadora. Para eso, verifica si la coleccion de numeros inluye a char, o si char es numero"
	^((numeros includes: char )| (char isNumber))