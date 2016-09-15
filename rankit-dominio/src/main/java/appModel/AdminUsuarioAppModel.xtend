package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import administracion.AdministracionUsuario
import model.Usuario
import java.util.List

@Accessors
@Observable
class AdminUsuarioAppModel {
	
	AdministracionUsuario admin
	List<Usuario> usuarios
	Usuario usuarioSeleccionado
	
	new() {
		admin = new AdministracionUsuario
	}
}