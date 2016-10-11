package app

import DataDummy.RankitDummy
import org.uqbar.xtrest.api.XTRest
import serviciosApp.CalificacionesService
import controller.CalificacionController

class CalificacionesApp {
	
	def static void main(String[] args) {
		
		var calificacionService = new CalificacionesService
		var calificaciones = new RankitDummy().crearDummyDataCalificacion.calificaciones
		
		for(var int i = 0; i < calificaciones.size; i++){
			calificacionService.agregarCalificacion(calificaciones.get(i));
		}
		
		XTRest.startInstance(new CalificacionController(calificacionService), 9000)
	}
}