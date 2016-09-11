package model

import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors

class Calificacion {
	Integer puntos
	DateTime FechaRegistro
	String detalle
	Boolean esOfensiva
	
	new() {
		esOfensiva = false
	}
}