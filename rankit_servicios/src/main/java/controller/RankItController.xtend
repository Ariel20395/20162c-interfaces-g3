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

@Controller
class RankItController {
	
	extension JSONUtils = new JSONUtils
	private RankItService rankItService
	
	new(RankItService service) {
		this.rankItService = service
	}
	
	@Get("/usuarios")
	def getUsuarios() {
		response.contentType = "application/json"
		ok(rankItService.getUsuarios.toJson)
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
			ok(rankItService.getIdUsuario(nombreUsuario).toJson)
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
	
}