aplicacion
prepararFuncion: expresion
	"Metodo utilitario. Recibe una funcion en string y devuelve una coleccion. Prepara la funcion dada para trabajarla mas facilmente en el parser. "
	|funcTemp charAnterior charActual whileTemp indexTemp tamañoFuncion|
	
	"Reemplaza las funciones de mas de un caracter por un identificador"
	funcTemp := (((((expresion 				
		copyReplaceAll: 'cos' with: 'c')
		copyReplaceAll: 'sin' with: 's')
		copyReplaceAll: 'sen' with: 's')
		copyReplaceAll: 'tan' with: 't')
		copyReplaceAll: 'sqrt' with: 'r').
	
	funcTemp := funcTemp asOrderedCollection.
	
	"Rechaza los caracteres de espacio"
	funcTemp := funcTemp reject: [ :char | char = $  ].		
	"Rechaza los caracteres de tabulacion"
	funcTemp := funcTemp reject: [ :char | char = $	 ].		
	"Rechaza los caracteres de enter"	
	funcTemp := funcTemp reject: [ :char | char = $
		]. 																	
	
	"Se estandarizan los operadores para hacer menos checkeos en el parser"																	
	funcTemp 	replaceAll: $, with: $.;		
		replaceAll: $− with: $-;
		replaceAll: $× with: $*;
		replaceAll: $÷ with: $/.
	
	"Este codigo agrega una multiplicacion entre numeros donde no hay operaciones, y por convencion hay una multiplicacion (ej: 2x pasa a ser 2*x)"
	indexTemp := OrderedCollection new.
	charAnterior := $ .
	whileTemp := 1.
	tamañoFuncion := funcTemp size.
	[ whileTemp <= tamañoFuncion ]			
	whileTrue:
		[
		charActual := funcTemp at: whileTemp.
		(((self esNumero: charAnterior) & (((charActual = $x) | (charActual = $()) | (charActual = $c) | (charActual = $s) | (charActual = $t) | (charActual = $r)))) | 
		(((charAnterior = $x) | (charAnterior = $) | (charAnterior = $!)) & (self esNumero: charActual)))
		ifTrue: 
			[ indexTemp add: whileTemp ].
		charAnterior := charActual.
		whileTemp := whileTemp + 1.
		].
	
	[ indexTemp notEmpty ]
	whileTrue:
		[
		funcTemp add: $* beforeIndex: (indexTemp last).
		indexTemp removeLast.
		].
	
	"Este codigo agrega parentesis alrededor de las x en la expresion"
	whileTemp := 1.
	[ whileTemp <= funcTemp size ]
	whileTrue:
		[
		((funcTemp at: whileTemp) = $x)
		ifTrue: 
			[
			funcTemp add: $) afterIndex: whileTemp.
			funcTemp add: $( beforeIndex: whileTemp.
			
			whileTemp := whileTemp + 2.
			].
		whileTemp := whileTemp + 1.
		].
	
	"Este codigo reemplaza el $- de los numeros negativos con $n, para identificarlo como una operacion separada que multiplica por -1 en el parser"
	charAnterior := $ .
	whileTemp := 1.		
	tamañoFuncion := funcTemp size.
	[ tamañoFuncion >= whileTemp ]
	whileTrue:
		[
		charActual := funcTemp at: whileTemp.
		(charActual = $-)
		ifTrue:			
			[
			((charAnterior ~= $)) & (self esToken: charAnterior))
			ifTrue:
				[ funcTemp at: whileTemp put: $n ]
			ifFalse:
				[
				(charAnterior = $ )
				ifTrue: 
					[ funcTemp at: whileTemp put: $n ]
				]
			].
		charAnterior := charActual.
		whileTemp := whileTemp + 1.
		].
		
	"Reemplaza a $π y a $e por sus valores numericos (aproximadamente)"
	funcTemp replaceAll: $π with: 3.141592653;
		replaceAll: $e with: 2.718281828.
			
	^funcTemp