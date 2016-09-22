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
	
	//Constructor
	new() {
		administracion = new AdministracionCalificacion()	
	}
	
<<<<<<< HEAD
	//Retorna la lista de calificaciones del 
	def List<Calificacion> getCalificacionesEvaluado() {
		administracion.buscarOfrecido(evaluadoBuscado)
	}
	
	//
	def List<Calificacion> getCalificacionesUsuarios() {
		administracion.buscarUsuario(usuarioBuscado)
=======
	def List<Calificacion> getCalificaciones() {
		administracion.buscarCalificacion(nombreUsuarioBuscado, nombreOfrecidoBuscado)
	}
	
	def void setNombreUsuarioBuscado(String nombre){
		this.nombreUsuarioBuscado = nombre
		firePropertyChanged(this,"calificaciones")
>>>>>>> d1aba0c40a2a24588b48afdfbd6b0e4c6c487641
	}
	
	def void setNombreOfrecidoBuscado(String nombre){
		this.nombreOfrecidoBuscado = nombre
		firePropertyChanged(this,"calificaciones")
	}
	
}