event handling
reajustar
	"Llamado cuando se necesita reajustar, por cualquier motivo, la grilla. Borra la grilla actual y crea una nueva con las nuevas condiciones."
	grilla delete.
	self crearGrilla;
		graficarVertices.