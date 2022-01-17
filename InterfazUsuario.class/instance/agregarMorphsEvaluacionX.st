añadir morphs
agregarMorphsEvaluacionX
	"Agrega los morphs necesarios para evaluar la funcion para un x dado, ademas de configurar sus propiedades."
	|labelTemp labelTemp2 tMTemp boton|
	
	tMTemp := TextMorph new.
	tMTemp extent: 25@50;
		color: Color black;
		backgroundColor: Color white.
				
	boton := BotonEvaluacionX parentMorph: self.
	boton position: (self left + boton width + tMTemp width)@(self center y + (1.5 * boton height));
		color: Color black;
		label: 'Evaluar en x = '.
		Transcript show: boton height.
		
	tMTemp position: (boton right + 5 ) @ (boton top + 1).
	
	self setTextMorphEvalX: tMTemp.
	self addMorph: tMTemp.
	self addMorph: boton.
	
	labelTemp := (LabelMorph newLabel: 'Resultado: ').
	labelTemp := labelTemp position: (boton left + 5) @ (boton bottom + 25).
	
	labelTemp2 := LabelMorph newLabel: ''.
	labelTemp2 position: (labelTemp right + 5 ) @ (labelTemp top);
		color: Color black;
		extent: 20@20;
		backgroundColor: Color white.
	
	self setLblResultado: labelTemp2.	
	self addMorph: labelTemp.
	self addMorph: labelTemp2.