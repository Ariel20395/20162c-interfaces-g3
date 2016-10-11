package administracion

import java.util.List
import java.util.ArrayList
import model.Calificacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException
import model.Comparador


@Accessors
@Observable

class AdministracionCalificacion {
	
	List<Calificacion> calificaciones = new ArrayList<Calificacion>()
	
	
	new() {
	}

	def buscarCalificacion(String nombreUsuario, String nombreOfrecido) {
		this.calificaciones.filter[calificacion | 

			Comparador.compararPorNombre(nombreUsuario, calificacion.usuario) &&
			Comparador.compararPorNombre(nombreOfrecido, calificacion.ofrecido)].toList
	}
	
	//crea una nueva calificacion con usuario "ADMIN" y descripcion "prueba"
	def nuevaCalificacion() {
		var Calificacion calificacion = new Calificacion(0, "prueba", "ADMIN", "")
		
		calificacion
	}
	
	def  void agregarCalificacion(Calificacion calificacion) {
		this.calificaciones.add(calificacion) 
	}
	
	
	def  void eliminarCalificacion(Calificacion calificacion) {
		if (this.calificaciones.empty) {
			throw new UserException ("no se puede eliminar, no hay más calificaciones")
		}
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