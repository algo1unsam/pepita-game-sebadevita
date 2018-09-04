import ciudades.*
import roque.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 
	var img = "pepita1.png"

	var property posicion = game.at(3,3)
	method imagen() = img

	method come(comida) {
		
		if (roque.comidaActual()!= null){
		
		energia = energia + comida.energia()
		game.addVisualIn(roque.comidaActual(), game.at(0.randomUpTo(9), 0.randomUpTo(9)))	
		roque.vaciarMano()
		
		if (energia>100){
			self.pepitaGorda()
		} else{
			self.pepitaNormal()
		}
		
		}
	}
	
	method volaHacia(unaCiudad) {
		
		if (self.energiaParaVolar(posicion.distance(unaCiudad.posicion()))< energia){
		
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.posicion())
			ciudad = unaCiudad
		} else{
			game.say(self, "ya estoy en una ciudad")
		}
				}else {
			
					game.say(self, "No me alcanza la energia")
			
		}
		
		}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
		
		if (energia<10){
			self.pepitaCansada()
		} else {
			
			self.pepitaNormal()
			
		}
		
	}
	
	method teEncontro(alguien){ 
	
		self.come(roque.comidaActual())

		
		}

	method	pepitaGorda(){
		
		img="pepita2.png"
		
	}
	
	method pepitaCansada(){
		
		img="pepita.png"
		
	}
	
	method pepitaNormal(){
		img="pepita1.png"
	}
		
	}
	
	