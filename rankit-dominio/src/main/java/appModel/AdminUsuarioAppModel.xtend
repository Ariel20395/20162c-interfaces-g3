package appModel

import administracion.AdministracionUsuario
import java.util.List
import model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

import static org.uqbar.commons.model.ObservableUtils.*
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
		admin.buscarUsuario(nombreUsuarioBuscado)
	}
	
	def void setNombreUsuarioBuscado(String nombre){
		this.nombreUsuarioBuscado = nombre
		firePropertyChanged(this,"usuarios")
	}

	def void setCrearNuevoUsuario() {
		this.admin.crearNuevoUsuario
		firePropertyChanged(this, "usuarios")
		firePropertyChanged(this, "cantidadDeUsuarios")
		cambioResumen
	}
	
	def void setEliminarUsuario() {
		this.admin.eliminarUsuario(this.usuarioSeleccionado)
		if(this.usuarios.empty) {
			throw new UserException("No hay mas usuarios")
		}
		this.usuarioSeleccionado = getUsuarios.get(0)
		firePropertyChanged(this, "usuarios")
		firePropertyChanged(this, "cantidadDeUsuarios")
		cambioResumen
	}
	
	def cambioResumen() {
		firePropertyChanged(this, "cantidadDeUsuariosActivos")
		firePropertyChanged(this, "cantidadDeUsuariosInactivos")
		firePropertyChanged(this, "cantidadDeUsuariosBaneados")
	}
	
	def getCantidadDeUsuarios() {
		this.admin.cantidadDeUsuarios
	}
	
	def getCantidadDeUsuariosActivos() {
		this.admin.cantidadDeUsuariosActivos
	}
	
	def getCantidadDeUsuariosInactivos() {
		this.admin.cantidadDeUsuariosInactivos
	}
	
	def getCantidadDeUsuariosBaneados() {
		this.admin.cantidadDeUsuariosBaneados
	}
	
	def void setUsuarioBaneado(Boolean baneado) {
		this.usuarioSeleccionado.setBaneado(baneado)
		cambioResumen
	}
	
	def getUsuarioBaneado() {
		this.usuarioSeleccionado.baneado
	}
	
	def void setUsuarioActivo(Boolean activo) {
		this.usuarioSeleccionado.setActivo(activo)
		cambioResumen
	}
	
	def getUsuarioActivo() {
		this.usuarioSeleccionado.activo
	}
}