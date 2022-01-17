añadir morphs
agregarMorphsIniciales
	"Llama a todos los metodos necesarios para agregar los morphs de la interfaz."
	self agregarMorphsEvaluacionX.
	self agregarMorphsExpresion.
	self agregarMorphsEvaluacionIntervalo.
	
	self addMorph: (LineMorph vertices: { (self left)@(self top + 25). self topRight + 25 } color: Color black borderWidth: 3 borderColor: Color black ).
	
	self addMorph: (LineMorph vertices: { self center. self bottomCenter } color: Color black borderWidth: 1 borderColor: Color black ).
	
	self addMorph: (LineMorph vertices: { self leftCenter. self rightCenter } color: Color black borderWidth: 1 borderColor: Color black ).