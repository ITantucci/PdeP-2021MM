class MedioDeTransporte {

	var property kilometrosPorHora
	var property precioPorKilometro

	method precioDelTransporte(unosKilometros) {
		return unosKilometros * self.precioPorKilometro()
	}

	method esAccesible(dineroDisponible, distanciaARecorrer) {
		return dineroDisponible >= self.precioDelTransporte(distanciaARecorrer)
	}

}

class Avion inherits MedioDeTransporte {

	const property nivelDeImpulsoAdicional
	const property cantidadDeTurbinas

	override method precioDelTransporte(unosKilometros) {
		return super(unosKilometros + nivelDeImpulsoAdicional * cantidadDeTurbinas)
	}

}

class Micro inherits MedioDeTransporte {

	override method precioPorKilometro() {
		precioPorKilometro = 5000
	}

}

class Tren inherits MedioDeTransporte {

	override method precioDelTransporte(unosKilometros) {
		return super(unosKilometros * 1.60934)
	}

}

class Barco inherits MedioDeTransporte {

	const probabilidadDeChocarse

	override method precioPorKilometro() {
		precioPorKilometro = 1000 * probabilidadDeChocarse
	}

}

