event handling
handleMouseWheel: evt
	"Este metodo es llamado al moverse la rueda del mouse en cualquier direccion."
	(evt isUp)
		ifTrue:
			[
			"Si la rueda se mueve hacia adelante hace zoom sobre el centro, aumentando la variable de separacionGrilla y llamando a reajustar para volver a graficar."
			separacionGrilla :=  separacionGrilla + 10. 
			self reajustar
			]
		ifFalse:
			[
			"Si la rueda se mueve hacia atras aleja la vista, reduciendo la variable de separacionGrilla y llamando a reajustar para volver a graficar.
			Con la excepcion en el caso de que separacionGrilla sea igual a 10, en cuyo caso no se hace, ya que produce un error en smalltalk."
			(separacionGrilla > 10)
			ifTrue: 
				[
				separacionGrilla := separacionGrilla - 10.
				self reajustar
				]
			].