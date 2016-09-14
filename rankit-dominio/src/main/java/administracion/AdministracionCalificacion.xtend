package administracion

import model.Usuario
import java.util.List
import java.util.ArrayList

class AdministracionCalificacion {
	
	List<Usuario> usuarios = new ArrayList<Usuario>()
	
	
	
	def buscarUsuario(Usuario unUsuario) {
		usuarios.stream()
				.filter(usuario -> usuario.nombre == unUsuario.nombre)
				.findFirst()
				.get()				
		
	}
}