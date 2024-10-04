import cultivos.*
import wollok.game.*


object hector {
	var property position = game.center()
	const property image = "player.png"

	method sembrarMaiz(){
		const maiz = new Maiz(position = position)
		granja.agregarCultivo(maiz)
		game.addVisual(maiz)
	}

	method sembrarTrigo(){
		const trigo = new Trigo(position = position)
		granja.agregarCultivo(trigo)
		game.addVisual(trigo)
	}

	method sembrarTomaco(){

		const tomaco = new Tomaco(position = position)
		granja.agregarCultivo(tomaco)
		game.addVisual(tomaco)
	}

	method regar(){

		self.cultivosEnMiPosicion().forEach{cultivo=>cultivo.crecer()}
		
	}

	method cultivosEnMiPosicion(){

		return granja.cultivosAca(position)
	}


}