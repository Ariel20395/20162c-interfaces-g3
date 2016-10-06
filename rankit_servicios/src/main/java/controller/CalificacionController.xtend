package controller

import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Delete
import serviciosApp.CalificacionesService
import modelServicios.CalificacionService

@Controller
class CalificacionController {
	extension JSONUtils = new JSONUtils
	CalificacionesService calificacionesService
	
	new(CalificacionesService calificacionesService) {
		this.calificacionesService = calificacionesService
		}
		
	@Get("/calificaciones")
		def getCalificaciones() {
			response.contentType = "application/json"
			ok(this.calificacionesService.getCalificaciones.toJson)
		}
		
	@Get("/calificaciones/:calificacion")
		def getCalificacionesPorUsuario() {
			response.contentType = "application/json"
			try {
				var calificaciones = this.calificacionesService.getCalificacionesDeUsuario(String.valueOf(calificacion))
					if (calificaciones.empty) {
						notFound('{"error": "la calificacion con ese usuario que quiere buscar no existe"}')
					} else {
							ok(calificaciones.toJson)
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
				var CalificacionService calificacionAEliminar = this.calificacionesService.getCalificacion(Integer.valueOf(id))
			    this.calificacionesService.eliminarCalificacion(calificacionAEliminar)
				
				if (calificacionAEliminar == null) {
					notFound("Calificacion no encontada")
					
				} else {
						ok("Calificacion eliminada")
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
	    	ok('{ "": "Calificacion editada" }')
        } catch (UnrecognizedPropertyException exception) {
        	badRequest('{ "error": "El body debe ser un Libro" }')        	
        }
        
    }*/
}