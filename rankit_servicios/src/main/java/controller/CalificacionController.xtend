package controller

import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import serviciosApp.CalificacionesService
import serviceLimitador.CalificacionMin
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import model.Calificacion

@Controller
class CalificacionController {
	extension JSONUtils = new JSONUtils
	CalificacionesService calificacionesService
	
	new(CalificacionesService calificacionesService) {
		this.calificacionesService = calificacionesService
		}
		
//	@Get("/calificaciones")
//		def getCalificaciones() {
//			response.contentType = "application/json"
//			ok(this.calificacionesService.getCalificaciones.toJson)
//		}

	@Get("/calificaciones")
	def getCalificaciones(String usuario) {
		response.contentType = "application/json"

		var calificaciones = this.calificacionesService.getCalificacionesDeUsuario(usuario)
		ok(calificaciones.toJson)
	}

		
//	@Get("/calificaciones/:calificacion")
//		def getCalificacionesPorUsuario() {
//			response.contentType = "application/json"
//			try {
//				var calificaciones = this.calificacionesService.getCalificacionesDeUsuario(String.valueOf(calificacion))
//					if (calificaciones.empty) {
//						notFound('{"error": "la calificacion con ese usuario que quiere buscar no existe"}')
//					} else {
//							ok(calificaciones.toJson)
//						   }
//			}
//       		catch (UserException ex) {
//        		badRequest('{ "error": "El usuario debe ser valido" }')
//      		}
//		}
	
	@Delete("/calificaciones/:id")
		def eliminarCalificacionID() {
			response.contentType = "application/json"
			try {
				var CalificacionMin calificacionAEliminar = this.calificacionesService.getCalificacion(Integer.valueOf(id))
			    this.calificacionesService.eliminarCalificacion(calificacionAEliminar)
				
				if (calificacionAEliminar == null) {
					notFound('{ "error": "Calificacion no encontrada" }')
					
				} else {
						ok('{ "correcto!": "Calificacion eliminada" }')
					   }
				}
			catch (NumberFormatException ex) {
        	badRequest('{ "error": "debe ingresar un número entero para el id" }')
      		}
		}
		
		@Post ("/calificaciones")
		def realizarCalificacion(@Body String body) {
			response.contentType = "application/json"
			var Calificacion calificacion = body.fromJson(typeof(Calificacion))
		
			this.calificacionesService.realizarCalificacion(calificacion)
			ok('{"" : "Calificacion realizada"}')
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