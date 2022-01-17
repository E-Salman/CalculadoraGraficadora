constructor
nueva: expresion a: comienzoIntervalo b: finalIntervalo n: cantidadPuntos
	"Metodo constructor de Grafica. Crea la ventana de la grafica y le asigna algunas propiedades."
	|ventana|
	ventana := self new.
	ventana width: (World width / 2);
		height: (World height / 1.2);
		crearGrilla;
		generarVertices: expresion a: comienzoIntervalo b: finalIntervalo n: cantidadPuntos;
		openInWorld: World extent: ventana extent;
		center: World center.
		"Configura un anunciador para que llame a reajustar cuando cambie el tamaño de la ventana."
		ventana announcer when: WindowResizing do: [ ventana reajustar ].
	^ventana