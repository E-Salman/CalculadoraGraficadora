añadir morphs
agregarMorphsExpresion
	"Agrega los morphs necesarios para ingresar la expresion, ademas de configurar sus propiedades"
	|tMTemp labelTemp|
	
	tMTemp := TextMorph new.
	tMTemp extent: 200@50;
		color: Color black;
		backgroundColor: Color white.		
		
	labelTemp := (LabelMorph newLabel: 'EXPRESION: f(x) =').	
	labelTemp position: (self left + labelTemp width) @ (self center y - ((tMTemp height) * 3)).
	tMTemp position: (labelTemp right) @ (labelTemp top).
	
	self setTextMorphExpresion: tMTemp.
	self addMorph: tMTemp.
	self addMorph: labelTemp.