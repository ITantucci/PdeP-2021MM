class MedioDeTransporte {

	const property kilometrosPorHora

	method precioPorKilometro()

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

	override method precioPorKilometro() {
		return nivelDeImpulsoAdicional * cantidadDeTurbinas
	}

}

class Micro inherits MedioDeTransporte {

	override method precioPorKilometro() {
		return 5000
	}

}

class Tren inherits MedioDeTransporte {

	override method precioPorKilometro() {
		return 2300
	}

	override method precioDelTransporte(unosKilometros) {
		return super(unosKilometros * 1.60934)
	}

}

class Barco inherits MedioDeTransporte {

	const probabilidadDeChocarse

	override method precioPorKilometro() {
		return 1000 * probabilidadDeChocarse
	}

}

