package serviciosApp

import java.util.ArrayList
import java.util.List
import model.Calificacion
import serviceLimitador.CalificacionMin

class CalificacionesService {
	
	List<CalificacionMin> calificaciones = new ArrayList<CalificacionMin>
	
	new() {
	}
	
	//Ingresa un objeto JSON a la coleccion de la siguiente manera {@Parameter id, @Parameter calificacion}. 
	def agregarCalificacion(Calificacion calificacion) {
		var nuevaCalificacion = new CalificacionMin(calificacion)
		
		calificaciones.add(nuevaCalificacion)
	}
	
	def agregarCalificacionMin(CalificacionMin calificacionMin) {
		calificaciones.add(calificacionMin)
	}
	
	
	//Retorna el objeto con el @Parameter id.
	def getCalificacion(Integer id) {
		var calificacionesAux = calificaciones
		
		calificacionesAux.findFirst[calificacion | calificacion.id == id]
	} 
	
	//Retorna el objeto con el usuario buscado en la calificacion.
	def getCalificacionesDeUsuario(String nombreDeUsuario) {
		var calificacionesAux = calificaciones
		
		calificacionesAux.filter[calificacion | calificacion.usuario == nombreDeUsuario].toList
	}
		
	
	//Elimina el objeto con el @Parameter id.
	def eliminarCalificacion(CalificacionMin calificacionMin) {
		calificaciones.remove(calificacionMin)
	}
	
	//Retorna todos los objetos de la colección.
	def getCalificaciones() {
		calificaciones
	}
	
	def realizarCalificacion(Integer puntos, String detalle, String nombreUsuario, String nombreOfrecido) {
		var Calificacion calificacion = new Calificacion(puntos, detalle, nombreUsuario, nombreOfrecido)
		var CalificacionMin calificacionMin = new CalificacionMin(calificacion)
		
		calificaciones.add(calificacionMin)
	}
}
