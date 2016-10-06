package controller

import java.util.HashMap
import java.util.Map
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.json.JSONUtils
import service.UsuarioService

@Controller
class UsuarioController {
	
	extension JSONUtils = new JSONUtils
	
	var UsuarioService usuarioService
	
	new(UsuarioService usuarioService) {
		this.usuarioService = usuarioService
	}
		
		
	@Get("/usuarios")
	def getUsuarios() {
		response.contentType = "application/json"
		ok(this.usuarioService.getUsuarios.toJson)
	}
	
	@Put("/usuarios")
    def createUsuario(@Body String body) {
        response.contentType = "application/json"
	    var Map<String, String> usuario = body.fromJson(typeof(HashMap))	
		val nombreUsuario = usuario.get("nombre")
		val passwordUsuario = usuario.get("password")

		if(! usuarioService.existeUsuarioConNombre(nombreUsuario)) {
			this.usuarioService.crearUsuario(nombreUsuario, passwordUsuario)
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

		if(usuarioService.existeUsuario(nombreUsuario, passwordUsuario)) {
			ok(usuarioService.getIdUsuario(nombreUsuario).toJson)
		} else if(usuarioService.passwordIncorrecto(nombreUsuario, passwordUsuario)) {
			badRequest(' { "Error": "Password incorrecto" }')
		} else {
			forbidden(' { "Error" : "Usuario no encontrado" } ')
		}
	}
	
}
