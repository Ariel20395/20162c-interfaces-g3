package administracion

import java.util.ArrayList
import java.util.List
import model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.Date

@Accessors
@Observable
class AdministracionUsuario {
	
	private List<Usuario> usuarios
	
	new() {
		usuarios = new ArrayList<Usuario>()
	}
	
	def void crearNuevoUsuario(String nombre, String pass, Date fecha) {
		/*	Crea un nuevo usuario y lo guarda en la lista de usuario registrados 
		 */
		var Usuario nuevoUsuario = new Usuario(nombre, pass, fecha) 
		agregarUsuario(nuevoUsuario)
	}
	
	def void agregarUsuario(Usuario usuario) {
		this.usuarios.add(usuario)
	}
}