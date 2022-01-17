graficador
graficarVertices
	"Toma los puntos generados por generarVertices:a:b:n: y los usa como vertices para crear lineas y representar la funcion."
	|vertice1 vertice2 tamañoStack|
	tamañoStack := vertices size - 1.
	1 to: tamañoStack do: [ :cont |
		vertice1 := (vertices at: cont).
		vertice2 := (vertices at: cont + 1).
		"Condicion para producir cortes en la grafica si hay mucha distancia entre un punto y el proximo. Causa errores en funciones con crecimiento muy rapido si no hay suficiente cantidad de puntos.
		Esta hecho asi porque conseguir esos cortes matematicamente hubiera requerido programar un resolvedor de ecuaciones para encontrarlos, lo que tomaria bastante mas horas que a mi parecer no estaria justificadas para el alcance de este proyecto. Esta condicion funciona bien para la gran mayoria de los casos."
		(((((((vertice1 y) negative) & (vertice2 y) positive) |
		(((vertice1 y) positive) & (vertice2 y) negative)))) & ((vertice1 dist: vertice2) > 5))
		ifFalse: 
			[
			"Si la condicion se cumple, se agrega una linea en la grilla con vertice1 como punto inicial y vertice2 como punto final."
			grilla addMorph:
			(LineMorph new vertices: { 
					(vertice1 x * separacionGrilla)@(vertice1 y * -1 * separacionGrilla) + grilla center.
					(vertice2 x * separacionGrilla)@(vertice2 y * -1 * separacionGrilla) + grilla center
					}
				color: Color black borderWidth: 3 borderColor: Color black).
			].
		].