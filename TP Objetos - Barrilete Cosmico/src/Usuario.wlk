import Localidad.*

class Usuario {

	var property nombreUsuario
	var property viajesRealizados = #{}
	var property plataDisponible
	var property usuariosSeguidos = #{}
	var property localidadDeOrigen
	var property perfil

	method viajar(unViaje) {
		self.verificarSiPuedoViajar(unViaje)
		self.agregarViajeRealizado(unViaje)
		self.meMudoA(unViaje)
		plataDisponible -= unViaje.precioDelViaje()
	}

	method verificarSiPuedoViajar(unViaje) {
		if (!unViaje.soyAccesible(self.plataDisponible())) {
			throw new Exception(message = "No me alcanza para pagar el viaje")
		}
	}

	method esMiLocalidadDeOrigen(unaLocalidad) {
		return self.localidadDeOrigen() == unaLocalidad
	}

	method agregarViajeRealizado(unViaje) {
		viajesRealizados.add(unViaje)
	}

	method meMudoA(unViaje) {
		self.localidadDeOrigen(unViaje.localidadDestino())
	}

	method kilometrosDelUsuario() {
		return viajesRealizados.map{ viaje => viaje.distanciaARecorrer() }.sum()
	}

	method seguirUsuario(user) {
		self.usuariosSeguidos().add(user)
		user.devolverFollow(self)
	}

	method devolverFollow(user) {
		self.usuariosSeguidos().add(user)
	}

	method medioDeTransporteElegido(unaEmpresa, unaLocalidadDestino) {
		return self.perfil().transporteElegido(unaEmpresa, self.plataDisponible(), self.distancia(unaLocalidadDestino))
	}

	method distancia(unDestino) {
		return self.localidadDeOrigen().distanciaA(unDestino)
	}

}

