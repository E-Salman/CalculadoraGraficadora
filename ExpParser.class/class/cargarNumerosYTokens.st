cargar estaticos
cargarNumerosYTokens
	"Carga las variables estaticas de numeros y tokens (en caso de que no esten ya cargadas) con colecciones de los caracteres aceptados por la calculadora, para usar en diversas verificaciones en el programa. Se optó en usar estas variables estaticas a modo de diccionario porque simplifican la lectura del codigo por sobre una cadena de ORs, ademas de devolver un resultado mas rápido."
	|coleccionTemp|
	(tokens isNil)
	ifTrue:
		[
		coleccionTemp := OrderedCollection new.
		coleccionTemp add: $+; add: $-; add: $/; add: $*; add: $!; add: $÷; add: $×; add: $^; add: $c; add: $s; add: $t; add: $r; add: $−; add: $(; add: $); add: $n.
		tokens := coleccionTemp.

		coleccionTemp := OrderedCollection new.
		coleccionTemp add: $0; add: $1; add: $2; add:$3; add: $4; add: $5; add: $6; add: $7; add: $8; add: $9; add: $.; add: $x.
		numeros := coleccionTemp.
		]