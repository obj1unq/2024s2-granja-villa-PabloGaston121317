import wollok.game.*
import hector.*

class Maiz {
	var property position = null
	var property image = "corn_baby" 

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return image +".png"
	}

	method crecer(){

		image = "corn_adult"

	}
}

class Trigo {

	var property position = null
	 var evolucion = 0

	method image(){

		return "wheat_" + evolucion  + ".png"
	}

	method crecer(){

		if (evolucion < 3) {
			evolucion += 1
		} else evolucion = 0

	}
}

class Tomaco {

	var property position = null

	method image(){

		return "tomaco.png"
	}

	method crecer(){
		position = game.at(position.x(),position.y() +1)
	}
}

object granja {

	const cultivos = #{}

	method hayCultivo(parcela){

		return cultivos.any({cultivo => cultivo.position() == parcela})
	}

	method cultivosAca(parcela){
		
		return cultivos.filter({cultivo => cultivo.position() == parcela})
	}

	method agregarCultivo(cultivo){
		cultivos.add(cultivo)
	}



}