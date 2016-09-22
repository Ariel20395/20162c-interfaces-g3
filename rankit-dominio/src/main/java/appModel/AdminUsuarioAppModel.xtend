package appModel

import org.uqbar.commons.utils.Observable
import administracion.AdministracionUsuario
import model.Usuario
import static org.uqbar.commons.model.ObservableUtils.*
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.UserException

@Accessors
@Observable
class AdminUsuarioAppModel {
	
	AdministracionUsuario admin
	Usuario usuarioSeleccionado
	String nombreUsuarioBuscado
		
	new() {
		admin = new AdministracionUsuario
	}
	
	def List<Usuario> getUsuarios() {
		if(admin.buscarUsuario(nombreUsuarioBuscado).isEmpty) {
			throw new UserException("No hay usuarios con ese nombre")
		}
		admin.buscarUsuario(nombreUsuarioBuscado)
	}
	
	def void setNombreUsuarioBuscado(String nombre){
		this.nombreUsuarioBuscado = nombre
		firePropertyChanged(this,"usuarios")
	}

	def void setCrearNuevoUsuario() {
		this.admin.crearNuevoUsuario
	}
	
}