package app

import org.uqbar.xtrest.api.XTRest
import controller.CalificacionController
import DataDummy.RankitDummy
import service.CalificacionService

class CalificacionesApp {
	
	def static void main(String[] args) {
		
		var calificaciones = new CalificacionService
		var calificacionesTotales = new RankitDummy().crearDummyDataCalificacion.calificaciones
		
		for(var int i = 0; i < calificacionesTotales.size; i++){
			calificaciones.setCalificacion(i, calificacionesTotales.get(i));
		}
		
		XTRest.startInstance(new CalificacionController(calificaciones), 9000)
	}
}