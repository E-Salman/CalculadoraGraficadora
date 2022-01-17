constructor
parentMorph: nMorph
	"Constructor del boton, guarda a nMorph como parentMorph para poder invocar metodos de el al clickearlo"
	|boton|
	boton := self new.
	boton setParentMorph: nMorph.
	^boton