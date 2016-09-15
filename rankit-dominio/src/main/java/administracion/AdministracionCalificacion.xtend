package administracion

import model.Usuario
import java.util.List
import java.util.ArrayList
import model.Ofrecido
import model.Calificacion

class AdministracionCalificacion {
	
	List<Calificacion> calificaciones = new ArrayList<Calificacion>()
	
	
	new() {
	}		
	
	
	def buscarUsuario(String nombre) {
		
		this.calificaciones.filter[calificacion | this.match(nombre, calificacion.usuario.nombre)].toList
	}
	
	
	def buscarOfrecido(String nombre) {
		
		this.calificaciones.filter[calificacion | this.match(nombre, calificacion.ofrecido.nombre)].toList
	}
	
	def match(Object expectedValue, Object realValue) {
		if (expectedValue == null) {
			return true
		}
		if (realValue == null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}
	
	
	def nuevaCalificacion() {
		var Usuario usuario = new Usuario("ADMIN", "123")
		var Ofrecido ofrecido = new Ofrecido("netflix")
		var Calificacion calificacion = new  Calificacion(7, "prueba", usuario, ofrecido)
		
		agregarCalificacion(calificacion)
	}
	
	
	def agregarCalificacion(Calificacion calificacion) {
		this.calificaciones.add(calificacion) 
	}
	
	
	def eliminarCalificacion(Calificacion calificacion) {
		this.calificaciones.remove(calificacion)
	}
	
}