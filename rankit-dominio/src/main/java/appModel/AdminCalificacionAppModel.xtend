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
	String nombreUsuarioBuscado
	String nombreOfrecidoBuscado
	
	new() {
		administracion = new AdministracionCalificacion()	
	}
	
	def List<Calificacion> getCalificaciones() {
		administracion.buscarCalificacion(nombreUsuarioBuscado, nombreOfrecidoBuscado)
	}
	
	def void setNombreUsuarioBuscado(String nombre){
		this.nombreUsuarioBuscado = nombre
		firePropertyChanged(this,"calificaciones")
	}
	
	def void setNombreOfrecidoBuscado(String nombre){
		this.nombreOfrecidoBuscado = nombre
		firePropertyChanged(this,"calificaciones")
	}
	
}