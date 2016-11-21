package controller

import service.RankItService
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Body
import java.util.HashMap
import java.util.Map
import org.uqbar.xtrest.api.annotation.Delete
import serviceLimitador.CalificacionMin

@Controller
class RankItController {
	
	extension JSONUtils = new JSONUtils
	private RankItService rankItService
	
	new(RankItService service) {
		this.rankItService = service
	}
	
	@Put("/usuarios")
    def createUsuario(@Body String body) {
        response.contentType = "application/json"
	    var Map<String, String> usuario = body.fromJson(typeof(HashMap))	
		val nombreUsuario = usuario.get("nombre")
		val passwordUsuario = usuario.get("password")

		if(! rankItService.existeUsuarioConNombre(nombreUsuario)) {
			rankItService.crearUsuario(nombreUsuario, passwordUsuario)
		    ok()    	
	    } else {
	    	badRequest('{ "error": "Nombre de usuario invalido" }')
	    }	
    }
    
	
	@Post("/usuarios")
	def logeo(@Body String body) {
		response.contentType = "application/json"
		
		var Map<String, String> usuario = body.fromJson(typeof(HashMap))
		val nombreUsuario = usuario.get("nombre")
		val passwordUsuario = usuario.get("password")

		if(rankItService.existeUsuario(nombreUsuario, passwordUsuario)) {
			ok(rankItService.getNombreUsuario(nombreUsuario).toJson)
		} else if(rankItService.passwordIncorrecto(nombreUsuario, passwordUsuario)) {
			badRequest(' { "Error": "Password incorrecto" }')
		} else {
			forbidden(' { "Error" : "Usuario no encontrado" } ')
		}
	}
	
	@Get("/evaluados")
	def getEvaluados(){
		response.contentType = "application/json"
		ok(this.rankItService.getOfrecidos.toJson)
	}
	
	@Get("/ranking")
	def buscarEvaluados(String nombre, String tipo, String calificaciones, String ranking){
		response.contentType = "application/json"
	
		ok(this.rankItService.buscar(nombre, tipo, calificaciones, ranking).toJson)
	}
	
	@Get("/calificaciones")
	def getCalificaciones(String usuario) {
		response.contentType = "application/json"

		var calificaciones = this.rankItService.getCalificacionesDeUsuario(usuario)
		ok(calificaciones.toJson)
	}

	@Delete("/calificaciones/:id")
	def eliminarCalificacionID() {
		response.contentType = "application/json"
		try {
			var CalificacionMin calificacionAEliminar = this.rankItService.getCalificacion(Integer.valueOf(id))
			this.rankItService.eliminarCalificacion(calificacionAEliminar)
				
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
			
			if(! rankItService.ingresoDeDatosCorrectos(puntos, detalle, evaluado)) {
				badRequest(' { "Error" : "No se informa el puntaje, el motivo de la calificacion o el evaluado" } ')
			} else {
				this.rankItService.realizarNuevaCalificacion(puntos, detalle, usuario, evaluado)
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
			
			if(! rankItService.ingresoDeDatosCorrectos(puntos, detalle, evaluado)) {
				badRequest(' { "Error" : "No se informa el puntaje, el motivo de la calificacion o 
				el evaluado de la calificacion a modificar" } ')
				
			} else if(! rankItService.existeCalificacion(idCalificacion)) {
				notFound('{ "error": "Calificacion no encontrada" }')
				
			} else {
				this.rankItService.editarCalificacionPorId(idCalificacion, puntos, detalle, evaluado)
				ok('{"" : "Calificacion Editada"}')
			}
			
		} catch(NumberFormatException e) {
			badRequest('{ "Error": "Debe ingresar un número entero para el id o el puntaje" }')
		}
	}
	
}