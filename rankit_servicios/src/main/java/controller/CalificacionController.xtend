package controller

import service.CalificacionService
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Controller

@Controller
class CalificacionController {
	extension JSONUtils = new JSONUtils
	CalificacionService calificacionService
	
	new(CalificacionService calificacionesService) {
		this.calificacionService = calificacionService
	}
	
	@Get("/calificaciones")
		def getCalificaciones() {
			response.contentType = "application/json"
			ok(this.calificacionService.getCalificaciones.toJson)
		}
		
	@Get("/calificaciones/:id")
	def getCalicicacionById() {
		response.contentType = "application/json"
		try {
			var calificacion = this.calificacionService.getCalificacion(Integer.valueOf(id))
				if (calificacion == null) {
					notFound('{"error": "la calificacion con ese id que quiere buscar no existe"}')
				} else {
					ok(calificacion.toJson)
				}
		}
		catch (NumberFormatException ex) {
			badRequest('{"error": "debe ingresar un número entero para el id"}')
		}
	}	
}