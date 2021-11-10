class Localidad {

	var property nombre
	const property equipajeImprescindible = #{}
	var property precio
	var property kilometro

//	const property tipoDeLocalidad
	method soyDestacado() {
		return self.precio() > 2000
	}

	method aplicarDescuento(porcentajeDelDescuento) {
		precio -= self.precio() * porcentajeDelDescuento / 100
		self.equipajeImprescindible().add("Certificado de descuento")
	}

	method soyPeligroso() {
		return self.perteneceAlEquipaje("Vacuna")
	}

	method distanciaA(unaLocalidad) {
		return (self.kilometro() - unaLocalidad.kilometro()).abs()
	}

	method perteneceAlEquipaje(elemento) {
		return self.equipajeImprescindible().any{ equipaje => equipaje.contains(elemento) }
	}

}

class Playa inherits Localidad {

	override method soyPeligroso() {
		return false
	}

}

class Montania inherits Localidad {

	const property altura

	override method soyPeligroso() {
		return self.tengoMuchaAltura() and super()
	}

	method tengoMuchaAltura() {
		return self.altura() > 5000
	}

	override method soyDestacado() {
		return true
	}

}

class CiudadHistorica inherits Localidad {

	const property cantidadMuseos

	override method soyPeligroso() {
		return self.perteneceAlEquipaje("Seguro de asistencia al viajero")
	}

	override method soyDestacado() {
		return super() and self.cantidadMuseos() > 2
	}

}

