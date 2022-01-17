graficador
crearGrilla
	"Crea la grilla para la funcion."
	grilla := Morph new.
	self addMorph: grilla.
	
	grilla color: Color white;
		bounds: self layoutBounds.
	
	self agregarLineasHorizontales.
	self agregarLineasVerticales.
	