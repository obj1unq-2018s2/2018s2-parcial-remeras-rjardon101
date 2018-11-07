class RemeraLisa {
	const property talle = 0
	const esDeColor = true
		
	method costoDeRemeraBase() = if(talle.between(32,40)) {80} else  100
	
	method costoDeRemera() = if(not esDeColor) {self.costoDeRemeraBase()}
		                     else self.costoDeRemeraBase() * 1.10
		                     
    method porcentajeDeDescuento() = 10	                     
}

class RemeraBordada inherits RemeraLisa {
	const coloresDeBordado = #{}
	
	override method costoDeRemera() = super() + 10 * coloresDeBordado.size()

    override method porcentajeDeDescuento() =  2
}

class RemeraSublimada inherits RemeraLisa {
	const altoDeSublimado = 0
	const anchoDeSublimado = 0
	const tieneDerechoDeAutor = false
	
	
	method costoDeSublimado() = altoDeSublimado * anchoDeSublimado *0.5	
	
	override method costoDeRemera() = super() + self.costoDeSublimado() 
	                                  + if(tieneDerechoDeAutor) costoDeDerechosDeAutor.costoDeDerecho() else 0

    override method porcentajeDeDescuento() =  if(tieneDerechoDeAutor) 20 else  10
}

/*esto lo hice así porque me dijeron que el costo podía variar por empresa 
 * con este tipo de codigo me ahorro un parametro en un metodo sobre escrito que no lo lleva
 */
object costoDeDerechosDeAutor {
	var property costoDeDerecho = 0
}

