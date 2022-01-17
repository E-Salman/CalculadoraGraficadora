constructor
parseExp: nuevaExp
	"Constructor de ExpParser. Crea una nueva instancia de ExpParser y llama a parse: con la expresion recibida (dene de haberse llamado a preparaFuncionMain: y prepararFuncionFinal: antes). Devuelve el resultado de parse:"
	|expParser exprTemp|
	expParser := self new.
	exprTemp := self prepararFuncion: nuevaExp.
	self verificarExpresion: exprTemp.
	^expParser parse: (exprTemp)
	