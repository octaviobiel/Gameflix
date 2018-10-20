object gameflix{
	var property listaDeJuegos = []
	
}

class Usuario{
	var property libreria = []
	var property suscripcion
	var property humor
	constructor(_suscripcion){
		suscripcion = _suscripcion
	}
	
	method jugar(_juego, _tiempo){
		_juego.tipo().efecto(_tiempo, self)
	}
	
	method filtrarJuegos(_categoria){
		gameflix.listaDeJuegos({})
	}
}


object premium {
	var property precio = 50
	method puedeJugarJuego(_juego){
		return true
	}
	method juegosQuePuedeJugar(){
		return gameflix.listaDeJuegos()
	}
}

object base{
	var property precio = 25
	method puedeJugar(_juego){
		return _juego.precio() < 30
	}
	method juegosQuePuedeJugar(){
		gameflix.listaDeJuegos().filter({juego => self.puedeJugar(juego)})
	}
	
}


object prueba{
	var property precio = 0
	method puedeJugar(_juego){
		return _juego.categoria() == "Demo"
	}
	method juegosQuePuedeJugar(){
		gameflix.listaDeJuegos().filter({{juego => self.puedeJugar(juego)}})
	}
}

object infantil{
	var property precio = 10
	method puedeJugar(_juego){
		return _juego.categoria() == "Infantil"
	}
	method juegosQuePuedeJugar(){
		gameflix.listaDeJuegos().filter({{juego => self.puedeJugar(juego)}})
	}
}

class Juego{
	var nombre
	var property precio
	var property categoria
	var property tipo
	
	constructor(_nombre, _precio, _categoria, _tipo){
		nombre = _nombre
		precio = _precio
		categoria = _categoria
		tipo = _tipo
	}
	
}

object violento{
	method efecto(_usuario, _tiempo){
		_usuario.humor() - 10 * _tiempo
	}
}
