package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class RankitAppModel {
	
	AdminUsuarioAppModel adminUsuario
	
	new() {
		adminUsuario = new AdminUsuarioAppModel
	}
}