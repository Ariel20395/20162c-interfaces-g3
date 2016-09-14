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
	
	new() {
		esOfensiva = false
	}
	
	new(Integer unosPuntos, DateTime unaFechaRegistro, String unDetalle) {
		this.puntos = puntos
		this.fechaRegistro = unaFechaRegistro
		this.detalle = unDetalle
		this.esOfensiva = false
	}
}