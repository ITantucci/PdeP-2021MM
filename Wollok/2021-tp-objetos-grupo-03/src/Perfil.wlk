object empresarial {

	method transporteElegido(empresa, dineroDisponible, distanciaARecorrer) {
		return empresa.medioDeTransporteMasRapido()
	}

}

object estudiantil {

	method transporteElegido(empresa, dineroDisponible, distanciaARecorrer) {
		return empresa.mediosDeTransporteAccesibles(dineroDisponible, distanciaARecorrer).max{ medioDeTransporte => medioDeTransporte.kilometrosPorHora() }
	}

}

object grupoFamiliar {

	method transporteElegido(empresa, dineroDisponible, distanciaARecorrer) {
		return empresa.algunMedioRandom()
	}

}

