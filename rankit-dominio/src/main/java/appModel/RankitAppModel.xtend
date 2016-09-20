package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class RankitAppModel {
	
	AdminUsuarioAppModel adminUsuario
	AdminCalificacionAppModel adminCalificacion
	
	new() {
		adminUsuario = new AdminUsuarioAppModel
		adminCalificacion = new AdminCalificacionAppModel
	}
}