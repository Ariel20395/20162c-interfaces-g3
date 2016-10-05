package controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import serviceApp.UsuarioService

@Controller
class UsuarioController {
	
	extension JSONUtils = new JSONUtils
	
	var UsuarioService usuarioService
	
	new(UsuarioService usuarioService) {
		this.usuarioService = usuarioService
	}
		
	
	
}
