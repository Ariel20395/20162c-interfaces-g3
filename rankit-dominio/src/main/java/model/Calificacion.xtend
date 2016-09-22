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
	
	new(Integer unosPuntos, String unDetalle, Usuario unUsuario, Ofrecido unOfrecido) {
		this.puntos = unosPuntos
		this.fechaRegistro = DateTime.now
		this.detalle = unDetalle
		this.esOfensiva = false
		this.usuario = unUsuario
		this.ofrecido = unOfrecido
	}
	
	def cambiarEsOfensiva() {
		this.esOfensiva = ! esOfensiva	
	}
	
	def getNombreUsuario() {
		this.usuario.nombre
	}
	
	def getNombreEvaluado() {
		this.ofrecido.nombre
	}
	
	def getFechaRegistro() {
		this.fechaRegistro.toString("dd/MM/YYYY HH:mm")
	}
	
}