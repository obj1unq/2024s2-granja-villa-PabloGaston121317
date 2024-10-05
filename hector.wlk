import cultivos.*
import wollok.game.*


object hector {
	var property position = game.center()
	const property image = "player.png"
	const property culCosechados = #{}
	var property monedas = 0

	method sembrarMaiz(){
		self.validarSiembra()
		granja.sembrar(new Maiz (position=position))
	}

	method sembrarTrigo(){
		self.validarSiembra()
		granja.sembrar(new Trigo(position = position))
	}

	method sembrarTomaco(){
		self.validarSiembra()
		granja.sembrar(new Tomaco(position = position))
	}

	//vi varias formas  de  crear un trigo tomaco o maiz, la hice de esta forma para sea diferente a las demas
	// pero creo que es mejor  crear  desde el keyboard.botton().pressDo({new Planta})

	method validarSiembra(){
		if( self.hayObjeto(position)){
			self.error("no puedo sembrar aqui")
		}
	}

	method hayObjeto(posicion){

		return granja.hayCultivo(posicion)
	}

	method regar(){
		self.validarRiego()
		granja.regarCultivo(position)
		
	}

	method validarRiego(){
		if (not self.hayObjeto(position)){
			self.error("no hay cultivo para regar")
		}
	}




	method cosechar(){

		self.validacionCosecha()
		granja.cosecharCultivo(self)
		

	}

	method validacionCosecha(){

		if(not self.hayObjeto(position)){
			self.error("no hay cultivo por cosechar")
		}
	}

	method agregarCultivo(cultivo){

		culCosechados.add(cultivo)
	}

	method venta(){
		monedas += self.totalDeMonedas()
		culCosechados.clear()
	}

	method totalDeMonedas(){

		return culCosechados.sum({cultivo => cultivo.valor()})
	}

	method infoGanancia(){

		return "tengo" + self.totalDeMonedas() + "monedas y " + self.cantidadParaVender() + "plantas para vender"
	}

	method cantidadParaVender(){

		return culCosechados.size()
	}

	method colocarAspersor(){

		const aspersor = new Aspersor(position = position)
		game.addVisual(aspersor)

		
	}



}