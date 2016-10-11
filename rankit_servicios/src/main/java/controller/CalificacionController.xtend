package controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils
import service.CalificacionesService
import serviceLimitador.CalificacionMin
import org.uqbar.xtrest.api.annotation.Put

@Controller
class CalificacionController {
	extension JSONUtils = new JSONUtils
	CalificacionesService calificacionesService
	
	new(CalificacionesService calificacionesService) {
		this.calificacionesService = calificacionesService
		}
		

	@Get("/calificaciones")
	def getCalificaciones(String usuario) {
		response.contentType = "application/json"

		var calificaciones = this.calificacionesService.getCalificacionesDeUsuario(usuario)
		ok(calificaciones.toJson)
	}

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
	def realizarCalificacion(String puntuacion, String detalle, String evaluado, String usuario) {
		response.contentType = "application/json"
	
		try {
			var Integer puntos = Integer.valueOf(puntuacion)
			
			if(! calificacionesService.ingresoDeDatosCorrectos(puntos, detalle, evaluado)) {
				badRequest(' { "Error" : "No se informa el puntaje, el motivo de la calificacion o el evaluado" } ')
			} else {
				this.calificacionesService.realizarCalificacion(puntos, detalle, usuario, evaluado)
				ok('{"" : "Calificacion realizada"}')
			}
		} catch(NumberFormatException e) {
			badRequest('{ "Error": "Debe ingresar un número entero para el puntaje" }')
		}
	}

	@Put("/calificaciones")
	def editarCalificacion(String id, String puntuacion, String detalle, String evaluado) {
		response.contentType = "application/json"
		
		try {
			var Integer idCalificacion = Integer.valueOf(id)
			var Integer puntos = Integer.valueOf(puntuacion)
			
			if(! calificacionesService.ingresoDeDatosCorrectos(puntos, detalle, evaluado)) {
				badRequest(' { "Error" : "No se informa el puntaje, el motivo de la calificacion o 
				el evaluado de la calificacion a modificar" } ')
				
			} else if(! calificacionesService.existeCalificacion(idCalificacion)) {
				notFound('{ "error": "Calificacion no encontrada" }')
				
			} else {
				this.calificacionesService.editarCalificacionPorId(idCalificacion, puntos, detalle, evaluado)
				ok('{"" : "Calificacion Editada"}')
			}
			
		} catch(NumberFormatException e) {
			badRequest('{ "Error": "Debe ingresar un número entero para el id o el puntaje" }')
		}
	}
	
}