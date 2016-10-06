package model

import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

@Observable
@Accessors

class Calificacion {
	Integer id
	Integer puntos
	DateTime fechaRegistro
	String detalle
	Boolean esOfensiva
	String nombreUsuario
	String nombreOfrecido
	
	new() {
		id = new Random().nextInt(1000)
		esOfensiva = false
		fechaRegistro = DateTime.now
	}
	
	//Constructor 
	new(Integer unosPuntos, String unDetalle, String unNombreUsuario, String unNombreOfrecido) {
		this.id = new Random().nextInt(1000)
		this.puntos = unosPuntos
		this.fechaRegistro = DateTime.now
		this.detalle = unDetalle
		this.esOfensiva = false
		this.nombreUsuario = unNombreUsuario
		this.nombreOfrecido = unNombreOfrecido
	}
	
	//Cambia la calificacion a true
	def activarEsOfensiva() {
		this.esOfensiva = true	
	}
	
	//Cambia la calificacion a false
	def rechazarEsOfensiva() {
		this.esOfensiva = false
	}
		
	//Retorna la fecha de registro de la calificacion.
	def getFechaRegistro() {
		this.fechaRegistro.toString("dd/MM/YYYY HH:mm")
	}
}