package appModel

import administracion.AdministracionCalificacion
import model.Calificacion
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class AdminCalificacionAppModel {
	AdministracionCalificacion administracion
	Calificacion calificacionSeleccionada
	String usuarioBuscado
	String evaluadoBuscado
	
	new() {
		administracion = new AdministracionCalificacion()	
	}
	
	def List<Calificacion> getCalificacionesEvaluado() {
		administracion.buscarOfrecido(evaluadoBuscado)
	}
	
	def List<Calificacion> getCalificacionesUsuarios() {
		administracion.buscarUsuario(usuarioBuscado)
	}
	
	def void setNombreUsuarioBuscado(String nombre){
		this.usuarioBuscado = nombre
		firePropertyChanged(this,"administracion.calificaciones")
	}
	
}