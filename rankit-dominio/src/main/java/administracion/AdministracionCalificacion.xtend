package administracion

import model.Usuario
import java.util.List
import java.util.ArrayList
import model.Ofrecido
import model.Calificacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable

class AdministracionCalificacion {
	
	List<Calificacion> calificaciones = new ArrayList<Calificacion>()
	
	
	new() {
	}

	def buscarCalificacion(String nombreUsuario, String nombreOfrecido) {
		this.calificaciones.filter[calificacion | 
			this.match(nombreUsuario, calificacion.usuario.nombre) &&
			this.match(nombreOfrecido, calificacion.ofrecido.nombre)].toList
	}

	def match(String expectedValue, String realValue) {
		if (expectedValue == null) {
			return true
		}
		if (realValue == null) {
			return false
		}
		realValue.toLowerCase().contains(expectedValue.toLowerCase())
	}
	
	
	def void nuevaCalificacion() {
		var Usuario usuario = new Usuario("ADMIN", "123")
		var Ofrecido ofrecido = new Ofrecido("prueba")
		var Calificacion calificacion = new Calificacion(7, "prueba", usuario, ofrecido)
		
		agregarCalificacion(calificacion)
	}
	
	def  void agregarCalificacion(Calificacion calificacion) {
		this.calificaciones.add(calificacion) 
	}
	
	
	def  void eliminarCalificacion(Calificacion calificacion) {
		this.calificaciones.remove(calificacion)
	}
	
	def Integer totalCalificacionesRegistradas() {
		this.calificaciones.size
	}
	
	def Integer totalCalificacionesOfensivas() {
		var List<Calificacion> ofensivas =	this.calificaciones.filter [calificacion | calificacion.esOfensiva == true].toList
		ofensivas.size
	}
	
	def Integer totalCalificacionesNoOfensivas() {
		totalCalificacionesRegistradas - totalCalificacionesOfensivas
	}
	
}