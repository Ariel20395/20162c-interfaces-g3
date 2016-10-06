package serviciosApp

import java.util.ArrayList
import java.util.List

class CalificacionesService {
	
	List<CalificacionMin> calificaciones = new ArrayList<CalificacionMin>
	
	new() {
	}
	
	//Ingresa un objeto JSON a la coleccion de la siguiente manera {@Parameter id, @Parameter calificacion}. 
	def setCalificacion(CalificacionMin calificacion) {
		calificaciones.add(calificacion)
	}
	
	//Retorna el objeto con el @Parameter id.
	def getCalificacion(Integer id) {
		var calificacionesAux = calificaciones
		calificacionesAux.findFirst[calificacion | calificacion.id == id]
	} 
	
	//Retorna el objeto con el usuario buscado en la calificacion.
	def getCalificacionesDeUsuario(String nombreDeUsuario) {
		var calificacionesAux = calificaciones
		calificacionesAux.filter[calificacion | calificacion.nombreUsuario == nombreDeUsuario]
	}
		
	
	//Elimina el objeto con el @Parameter id.
	def eliminarCalificacion(CalificacionMin calificacion) {
		calificaciones.remove(calificacion)
		
	}
	
	//Retorna todos los objetos de la colección.
	def getCalificaciones() {
		calificaciones
	}
}
