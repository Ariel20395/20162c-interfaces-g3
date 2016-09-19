package appModel

import administracion.AdministracionCalificacion
import model.Calificacion
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class AdminCalificacionAppModel {
	AdministracionCalificacion administracion
	Calificacion calificacionSeleccionada
	
	new() {
		administracion = new AdministracionCalificacion()	
	}
}