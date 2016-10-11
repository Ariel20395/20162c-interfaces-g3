package serviceLimitador

import org.eclipse.xtend.lib.annotations.Accessors
import model.Usuario

@Accessors
class UsuarioMin {
	
	private String 	nombre
	private String 	password
	private Integer id
	
	new(Usuario usuario) {
		this.nombre 	= usuario.nombre
		this.password	= usuario.password
		this.id			= usuario.id
	}
	
	
}