package appModel

import administracion.AdministracionCalificacion
import java.util.List
import model.Usuario
import model.Ofrecido
import model.Calificacion
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class AdminCalificacionAppModel {
	AdministracionCalificacion administracion
	List<Calificacion> calificaciones
	Calificacion calificacionSeleccionada
	
	new() {
		administracion = new AdministracionCalificacion()	
	}
}