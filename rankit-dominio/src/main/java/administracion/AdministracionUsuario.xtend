package administracion

import java.util.ArrayList
import java.util.List
import model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import model.Comparador

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
		this.usuarios.filter[usuario | Comparador.compararPorNombre(nombre, usuario.nombre)	].toList
	}
	
	def void eliminarUsuario(Usuario usuario) {
		/*	Elimina a un usuario de la lista de usuarios */
		this.usuarios.remove(usuario)
	}
	
	def cantidadDeUsuarios() {
		this.usuarios.size
	}
	
	def cantidadDeUsuariosActivos() {
		usuarioActivos.size
	}
	
	def usuarioActivos() {
		this.usuarios.filter[usuario | usuario.activo == true].toList
	}
	
	def cantidadDeUsuariosInactivos() {
		usuariosInactivos.size
	}
	
	def usuariosInactivos() {
		this.usuarios.filter[usuario | usuario.activo == false].toList
	}
	
	def cantidadDeUsuariosBaneados() {
		usuariosBaneados.size
	}
	
	def usuariosBaneados() {
		this.usuarios.filter[usuario | usuario.baneado].toList
	}
	
	
	
}