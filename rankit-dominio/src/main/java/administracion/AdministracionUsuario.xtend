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
	
	def buscarUsuario(String nombre) {
		/*	Filtra la lista de usuarios por nombre	*/
		this.usuarios.filter[usuario | this.match(nombre, usuario.nombre)].toList
	}
	
	def match(Object expectedValue, Object realValue) {
		if (expectedValue == null) {
			return true
		}
		if (realValue == null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}
	
	def eliminarUsuario(Usuario usuario) {
		/*	Elimina a un usuario de la lista de usuarios */
		this.usuarios.remove(usuario)
	}
	
	
}