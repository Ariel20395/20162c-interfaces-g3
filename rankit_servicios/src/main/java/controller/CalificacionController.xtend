package controller

import org.uqbar.xtrest.json.JSONUtils
import administracion.CalificacionesMap
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Controller

@Controller
class CalificacionController {
	extension JSONUtils = new JSONUtils
	CalificacionesMap calificacionesMap
	
	new(CalificacionesMap calificacionesMap) {
		this.calificacionesMap = calificacionesMap
	}
	
	@Get("/calificaciones")
		def getCalificaciones() {
			response.contentType = "application/json"
			ok(this.calificacionesMap.getCalificaciones.toJson)
		}
		
	@Get("/calificaciones/:id")
	def getCalicicacionById() {
		response.contentType = "application/json"
		try {
			var calificacion = this.calificacionesMap.getCalificacion(Integer.valueOf(id))
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