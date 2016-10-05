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
	Ofrecido ofrecido
	
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
		this.usuario = unUsuario
		this.ofrecido = unOfrecido
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
		this.usuario.nombre
	}
	
	//Retorna el nombre del evaluado.
	def getNombreEvaluado() {
		this.ofrecido.nombre
	}
	
	//Retorna la fecha de registro de la calificacion.
	def getFechaRegistro() {
		this.fechaRegistro.toString("dd/MM/YYYY HH:mm")
	}
	
}