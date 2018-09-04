import ciudades.*
import roque.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property posicion = game.at(3,3)
	method imagen() = "pepita.png"

	method come(comida) {
		
		if (roque.comidaActual()!= null){
		
		energia = energia + comida.energia()
		game.addVisualIn(roque.comidaActual(), game.at(0.randomUpTo(9), 0.randomUpTo(9)))	
		roque.vaciarMano()
		
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
	}
	
	method teEncontro(alguien){ 
	
		self.come(roque.comidaActual())
//		game.addVisualIn(roque.comidaActual(), game.at(5, 0.randomUpTo(9)))	
//		roque.vaciarMano()
		
		}
	
		
	}
		

