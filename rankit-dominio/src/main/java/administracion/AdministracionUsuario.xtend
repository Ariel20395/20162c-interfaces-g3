package administracion

import java.util.ArrayList
import java.util.List
import model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AdministracionUsuario {
	
	private List<Usuario> usuarios
	
	new() {
		usuarios = new ArrayList<Usuario>()
	}
	
	def void crearNuevoUsuario() {
		/*	Crea un nuevo usuario con nombre "NN", password "123" y lo guarda en la 
		 * 	lista de usuario registrados 
		 */
		var Usuario nuevoUsuario = new Usuario("NN", "123") 
		agregarUsuario(nuevoUsuario)
	}
	
	def void agregarUsuario(Usuario usuario) {
		this.usuarios.add(usuario)
	}
}