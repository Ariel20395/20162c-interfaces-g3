package app

import service.UsuarioService
import DataDummy.RankitDummy
import controller.UsuarioController
import org.uqbar.xtrest.api.XTRest

class UsuarioApp {
	
	def static void main(String[] args) {
		
		var usuarioService = new UsuarioService
		var usuarios = new RankitDummy().crearAdminUsuarioDummy.usuarios
		
		for(var int i = 0; i < usuarios.size; i++){
			usuarioService.setUsuario(usuarios.get(i));
		}
		
		XTRest.startInstance(new UsuarioController(usuarioService), 9000)
	}
}