package app

import org.uqbar.xtrest.api.XTRest
import controller.CalificacionController
import serviciosApp.CalificacionesService
import modelServicios.CalificacionService
import ServiceLimitador.CalificacionMin
import model.Calificacion

class CalificacionesApp {
	
	def static void main(String[] args) {
		
		var calificaciones = new CalificacionesService

		var calificacion1 = new CalificacionMin(8,"Miguel", "netflix")
		var calificacion2 = new CalificacionMin(8, "Miguel", "cablevision")
		var calificacion3 = new CalificacionMin(8, "Jose", "telecentro")
		var calificacion4 = new CalificacionMin(8, "Juan", "carpinteria")
		var calificacion5 = new CalificacionMin(8, "Martin", "correoARG")
		var calificacion6 = new CalificacionMin(9, "Germnan", "netflix")
		var calificacion7 = new CalificacionMin(9, "Anabela", "cineHoyts")
		var calificacion8 = new CalificacionMin(6, "Cecilia", "netflix")
		var calificacion9 = new CalificacionMin((new Calificacion(9,"Juana", "cineHoyts")))
		
		
		calificaciones.setCalificacion(calificacion1)
		calificaciones.setCalificacion(calificacion2)
		calificaciones.setCalificacion(calificacion3)
		calificaciones.setCalificacion(calificacion4)
		calificaciones.setCalificacion(calificacion5)
		calificaciones.setCalificacion(calificacion6)
		calificaciones.setCalificacion(calificacion7)
		calificaciones.setCalificacion(calificacion8)
		calificaciones.setCalificacion(calificacion9)
			
		
		XTRest.startInstance(new CalificacionController(calificaciones), 9000)
	}
}