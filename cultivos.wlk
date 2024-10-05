import wollok.game.*
import hector.*

class Maiz {
	var property position = null
	var property image = "corn_baby" 
	const oro = 150

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return image +".png"
	}

	method crecer(){

		image = "corn_adult"

	}

	method cosechar(){
		self.validarCosechaDeMaiz()
		game.removeVisual(self)
	}

	method validarCosechaDeMaiz(){
		if (not self.esAdulto()){
			self.error("El maiz esta listo para la cosecha")
		}
	}

	method esAdulto(){

		return image == "corn_adult"
	}

	method valor(){

		return oro
	}
}

class Trigo {

	var property position = null
	 var evolucion = 0
	 const oro = 100

	method image(){

		return "wheat_" + evolucion  + ".png"
	}

	method crecer(){

		if (evolucion < 3) {
			evolucion += 1
		} else evolucion = 0

	}

	method cosechar(){
		self.validarCosechaDeTrigo()
		game.removeVisual(self)
	}

	method validarCosechaDeTrigo(){
		if(not self.tieneEvolucionApta()){
			self.error("El trigo no esta listo para cosechar")
		}
	}

	method tieneEvolucionApta(){

		return evolucion >= 2
	}

	method valor(){

		return  (evolucion -1) * oro
	}


}

class Tomaco {

	var property position = null
	const oro = 80

	method image(){

		return "tomaco.png"
	}

	method crecer(){
		position = game.at((position.x()),self.limiteParaCrecer())
	}

	method limiteParaCrecer(){

		return (game.width()-1).min(position.y() +1)
	}

	method cosechar(){
		game.removeVisual(self)
	}

	method valor(){

		return oro
	}
}

object granja {

	const property cultivos = #{}

	method hayCultivo(parcela){

		return cultivos.any({cultivo => cultivo.position() == parcela})
	}

	method cultivosAca(parcela){
		
		return cultivos.filter({cultivo => cultivo.position() == parcela})
	}

	method agregarCultivo(cultivo){
		cultivos.add(cultivo)
	}

	method sembrar(cultivo){
		self.agregarCultivo(cultivo)
		game.addVisual(cultivo)

	}

	method regarCultivo(posicion){
		self.cultivoParcela(posicion).crecer()
	}

	method cosecharCultivo(granjero){
		granjero.agregarCultivo(self.cultivoParcela(granjero.position()))
		self.cultivoParcela(granjero.position()).cosechar()

	}

	method cultivoParcela(parcela){

		return cultivos.find({cultivo => cultivo.position() == parcela})
	}

	method agregarAspersor(){

	}



}

class Aspersor {
	var property position = null

	method image(){

		return "aspersor.png"
	}

}