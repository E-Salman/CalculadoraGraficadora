aplicacion
verificarExpresion: expresion
	"Realiza algunas verificaciones generales en los datos ingresados por el usuario en la expresion. Tira un InputError si encuentra algun error."
	(expresion contents = '')
	ifTrue:
		[ InputError new signal: 'Debe ingresar una expresion en f(x) antes de poder evaluar la expresion' ]
	ifFalse:
		[
		(expresion do: [ :char |
			((self esNumero: char) | (self esToken: char)) 
			ifFalse:
				[ InputError new signal: 'Ingresó un caracter invalido en la expresion f(x)' ]
			])
		].