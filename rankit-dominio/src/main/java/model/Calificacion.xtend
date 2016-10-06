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
	String usuario
	String ofrecido
	
	new() {
		esOfensiva = false
		fechaRegistro = DateTime.now
	}
	
	//Constructor 
	new(Integer unosPuntos, String unDetalle, Usuario unUsuario, Ofrecido unOfrecido) {
		this.puntos = unosPuntos
		this.fechaRegistro = DateTime.now
		this.detalle = unDetalle
		this.esOfensiva = false
		this.usuario = unUsuario.nombre
		this.ofrecido = unOfrecido.nombre
	}
	
	//Cambia la calificacion a el not de esOfensiva.
	def activarEsOfensiva() {
		this.esOfensiva = true	
	}
	
	def rechazarEsOfensiva() {
		this.esOfensiva = false
	}
	
	//Retorna el nombre del usuario.
	def getNombreUsuario() {
		this.usuario
	}
	
	//Retorna el nombre del evaluado.
	def getNombreEvaluado() {
		this.ofrecido
	}
	
	//Retorna la fecha de registro de la calificacion.
	def getFechaRegistro() {
		this.fechaRegistro.toString("dd/MM/YYYY HH:mm")
	}
	
}