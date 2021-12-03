import Viaje.*

class Empresa {

	var property localidades = #{}
	var property mediosDeTransporte = #{}

	method localidadesImportantes() {
		return self.localidades().filter{ localidad => localidad.soyDestacado() }
	}

	method aplicarDescuentoALasLocalidades(porcentajeDelDescuento) {
		self.localidades().forEach{ localidad => localidad.aplicarDescuento(porcentajeDelDescuento)}
	}

	method soyExtrema() {
		return self.localidadesImportantes().any{ localidadDestacada => localidadDestacada.soyPeligroso() }
	}

	method nombresDeLaLocalidad() {
		return self.localidades().map{ localidad => localidad.nombre() }
	}

	method armarViaje(unUsuario, unaLocalidadDestino) {
		self.verificarSiPuedoArmarViaje(unUsuario, unaLocalidadDestino)
		return new Viaje(localidadOrigen = unUsuario.localidadDeOrigen(), localidadDestino = unaLocalidadDestino, medioDeTransporte = unUsuario.medioDeTransporteElegido(self, unaLocalidadDestino))
	}

	method verificarSiPuedoArmarViaje(unUsuario, unaLocalidadDestino) {
		if (unUsuario.esMiLocalidadDeOrigen(unaLocalidadDestino)) {
			throw new Exception(message = "El destino coincide con la localidad de origen")
		}
	}

	method medioDeTransporteMasRapido() {
		return self.mediosDeTransporte().max{ medioDeTransporte => medioDeTransporte.kilometrosPorHora() }
	}

	method mediosDeTransporteAccesibles(dineroDisponibleDelUsuario, distanciaARecorrer) {
		return self.mediosDeTransporte().filter{ medioDeTransporte => medioDeTransporte.esAccesible(dineroDisponibleDelUsuario, distanciaARecorrer) }
	}

	method algunMedioRandom() {
		return self.mediosDeTransporte().anyOne()
	}

}

