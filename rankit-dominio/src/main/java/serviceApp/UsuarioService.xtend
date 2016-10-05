package serviceApp

import java.util.HashMap
import model.Usuario

class UsuarioService {
	
	new() {
		
	}
	
	var usuarios = new HashMap<String, Usuario>()
	
	def getUsuarios() {
		/*	Retorna los usuarios	*/
		usuarios.values
	}
}