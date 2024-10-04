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


		
	}

	method retroceder(){

		position = position.left(1)
	}

	method avanzar(){

		position = position.right(1)

	}

	method subir(){

		position = position.up(1)
	}

	method bajar(){

		position = position.down(1)
	}
}