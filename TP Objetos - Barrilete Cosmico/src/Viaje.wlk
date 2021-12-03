class Viaje {

	var property localidadOrigen
	var property localidadDestino
	var property medioDeTransporte

	method precioDelViaje() {
		return self.medioDeTransporte().precioDelTransporte(self.distanciaARecorrer()) + self.localidadDestino().precio()
	}

	method distanciaARecorrer() {
		return self.localidadOrigen().distanciaA(self.localidadDestino())
	}

	method soyAccesible(unMonto) {
		return unMonto >= self.precioDelViaje()
	}

}

