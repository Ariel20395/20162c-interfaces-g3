package administracion

import java.util.HashMap
import model.Calificacion

class CalificacionesMap {
	
	var calificacionById = new HashMap<Integer, Calificacion>
	
	//Ingresa un objeto JSON a la coleccion de la siguiente manera {@Parameter id, @Parameter calificacion}. 
	def setCalificacion(Integer id, Calificacion calificacion) {
		calificacionById.put(id, calificacion)
	}
	
	//Retorna el objeto con el @Parameter id.
	def getCalificacion(Integer id) {
		var calificaciones = new HashMap<Integer, Calificacion>
		calificaciones = calificacionById
		calificaciones.filter[k, v| k == id]
	} 
	
	//Retorna el objeto con el usuario buscado en la calificacion.
	def getCalificacionesDeUsuario(String nombreUsuario) {
		var calificaciones = new HashMap<Integer, Calificacion>
		calificaciones = calificacionById
		calificaciones.filter[k, v| v.nombreUsuario == nombreUsuario]
	}
		
	
	//Elimina el objeto con el @Parameter id.
	def eliminarCalificacion(Integer id) {
		calificacionById.remove(id)
		
	}
	
	//Retorna todos los objetos de la colección.
	def getCalificaciones() {
		calificacionById
	}
}