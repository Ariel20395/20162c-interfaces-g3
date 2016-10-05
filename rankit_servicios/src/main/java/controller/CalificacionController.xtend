package controller

import org.uqbar.xtrest.json.JSONUtils
import administracion.CalificacionesMap
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Delete

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
		
	 @Get("/calificaciones/:calificacion")
		def getCalificacionesByUsuario() {
			response.contentType = "application/json"
			try {
				var calificacionMap = this.calificacionesMap.getCalificacionesDeUsuario(String.valueOf(calificacion))
					if (calificacionMap.empty) {
						notFound('{"error": "la calificacion con ese usuario que quiere buscar no existe"}')
					} else {
							ok(calificacionMap.toJson)
						   }
			}
       		catch (UserException ex) {
        		badRequest('{ "error": "El usuario debe ser valido" }')
      		}
		}
	
	@Delete("/calificaciones/:id")
		def eliminarCalificacionID() {
			response.contentType = "application/json"
			try {
				var calificacion = this.calificacionesMap.eliminarCalificacion(Integer.valueOf(id))
				if (this.calificacionesMap.calificaciones.get(Integer.valueOf(id)) != calificacion) {
					ok('{ "correcto!": "Calificacion eliminada" }')
					
				} else {
					
						notFound('{"error": "la calificacion con ese id que quiere buscar no existe"}')
					   }
				}
			catch (NumberFormatException ex) {
        	badRequest('{ "error": "debe ingresar un número entero para el id" }')
      		}
		}
			
		
		/* @Put("/calificaciones")
    def crearCalificacion(Integer id, Calificacion calificacion) {
        response.contentType = "application/json"
        try {
	       	
	        this.calificacionesMap.setCalificacion(id, calificacion)
	    	ok()
        } catch (UnrecognizedPropertyException exception) {
        	badRequest('{ "error": "El body debe ser un Libro" }')        	
        }
        
    }*/
}