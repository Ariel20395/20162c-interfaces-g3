package model

import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors

class Calificacion {
	Integer puntos
	DateTime fechaRegistro
	String detalle
	Boolean esOfensiva
	Usuario usuario
	Servivio servicio
	
	new() {
		esOfensiva = false
		fechaRegistro = DateTime.now
	}
	
	new(Integer unosPuntos, String unDetalle, Usuario usuario, Servicio servicio) {
		this.puntos = puntos
		this.fechaRegistro = DateTime.now
		this.detalle = unDetalle
		this.esOfensiva = false
		this.usuario = usuario
		this.servicio = servicio
	}
}