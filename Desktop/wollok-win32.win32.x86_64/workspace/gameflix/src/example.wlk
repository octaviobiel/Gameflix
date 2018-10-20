object catalogo{
	var property listaDeJuegos = []	
	method filtrarJuegos(_categoria){
		self.listaDeJuegos({juego => juego.categoria() == _categoria})
	}
	method buscarJuego(_juego){
	}
}
class Usuario{
	var property suscripcion
	var property humor = 50
	constructor(_suscripcion){
		suscripcion = _suscripcion
	}
	method jugar(_juego, _tiempo){
		_juego.tipo().efecto(self, _tiempo)
	}
	
}
object premium {
	var property precio = 50
	method puedeJugar(_juego){
		return true
	}
	method juegosQuePuedeJugar(){
		return catalogo.listaDeJuegos()
	}
}
object base{
	var property precio = 25
	method puedeJugar(_juego){
		return _juego.precio() < 30
	}
	method juegosQuePuedeJugar(){
		catalogo.listaDeJuegos().filter({juego => self.puedeJugar(juego)})
	}
}
object prueba{
	var property precio = 0
	method puedeJugar(_juego){
		return _juego.categoria() == "Demo"
	}
	method juegosQuePuedeJugar(){
		catalogo.listaDeJuegos().filter({{juego => self.puedeJugar(juego)}})
	}
}
object infantil{
	var property precio = 10
	method puedeJugar(_juego){
		return _juego.categoria() == "Infantil"
	}
	method juegosQuePuedeJugar(){
		catalogo.listaDeJuegos().filter({{juego => self.puedeJugar(juego)}})
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
		return _usuario.humor(_usuario.humor() - 10 * _tiempo)
	}
}
object terror{
	method efecto(_usuario, _tiempo){
		return _usuario.suscripcion(infantil)
	}
}
object moba{
	method efecto(_usuario, _tiempo){
		return _usuario.dinero(_usuario.dinero() - 30)
	}
}
object estrategico{
	method efecto(_usuario, _tiempo){
		return _usuario.humor(5*_tiempo)
	}
}
