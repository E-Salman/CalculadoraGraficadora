initialization
initialize
	super initialize.
	ExpParser cargarNumerosYTokens.
	"Se deshabilitan los morphs para maximizar la ventana."
	((self submorphs at: 9) submorphs at: 9) delete.	
	((self submorphs at: 9) submorphs at: 4) delete.	
	self title: 'Calculadora';
		width: 515;
		height: 275;
		isResizeable: false.	
	
	self openInWorld: World extent: self extent.
	self agregarMorphsIniciales.