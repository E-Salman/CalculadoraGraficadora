añadir morphs
agregarMorphsEvaluacionIntervalo
	"Agregalos morphs necesarios para evaluar el intervalo y graficar la funcion, ademas de configurar sus propiedades."
	|tMTemp labelTemp labelTemp2 boton|
	
	tMTemp := TextMorph new.
	tMTemp extent: 25@50;
		color: Color black;
		backgroundColor: Color white.
	
	labelTemp := LabelMorph newLabel: 'Graficar para intervalo desde:'.
	labelTemp position: ((self center x - ((self center x + labelTemp width + tMTemp width - self right) / 2)) @ (self center y + (labelTemp height * 1.5))).
	tMTemp position: (labelTemp right + 5) @ (labelTemp top).
	Transcript show: labelTemp height.
	self setTextMorphIntervaloA: tMTemp.
	self addMorph: tMTemp.
	self addMorph: labelTemp.
	
	labelTemp := LabelMorph newLabel: 'hasta:'.
	labelTemp2 := LabelMorph newLabel: 'cantidad de puntos:'.
	labelTemp position: ((self right + self center x - (tMTemp width * 2) -  labelTemp width - labelTemp2 width ) / 2)@ (tMTemp bottom + 25).	
	
	tMTemp := TextMorph new.
	tMTemp extent: 25@50;
		color: Color black;
		backgroundColor: Color white.
	tMTemp position: (labelTemp right + 2) @ (labelTemp top).	
		
	self setTextMorphIntervaloB: tMTemp.
	self addMorph: tMTemp.
	self addMorph: labelTemp.
	
	labelTemp2 position: (tMTemp right + 5) @ (tMTemp top).	
		
	tMTemp := TextMorph new.
	tMTemp extent: 25@50;
		color: Color black;
		backgroundColor: Color white.
	tMTemp position: (labelTemp2 right + 5) @ (labelTemp2 top).	
		
	boton := BotonGraficar parentMorph: self.
	boton label: 'Graficar'; 
		center: (((self right - self center x) / 2) + (self center x)) @ (labelTemp bottom + 25);
		color: Color black.
		
	self setTextMorphIntervaloN: tMTemp.
	self addMorph: tMTemp.
	self addMorph: labelTemp2.
	self addMorph: boton.
	