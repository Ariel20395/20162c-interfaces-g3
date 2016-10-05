package appModel

import administracion.AdministracionCalificacion
import java.util.List
import model.Calificacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

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
	
	def List<Calificacion> getCalificaciones() {
		administracion.buscarCalificacion(nombreUsuarioBuscado, nombreOfrecidoBuscado)
	}
	
	def void setNombreUsuarioBuscado(String nombre){
		this.nombreUsuarioBuscado = nombre
		firePropertyChanged(this,"calificaciones")
	}
	
	def void setNombreOfrecidoBuscado(String nombre){
		this.nombreOfrecidoBuscado = nombre
		firePropertyChanged(this, "calificaciones")
		firePropertyChanged(this, "totalCalificacionesRegistradas")
	}
	
	def void setNuevaCalificacion() {
		
		var calificacion = administracion.nuevaCalificacion
		
		administracion.agregarCalificacion(calificacion)
		this.calificacionSeleccionada = calificacion
		this.notificarAObservadores
	}
	
	def void eliminarCalificacion() {
		administracion.eliminarCalificacion(calificacionSeleccionada)
		this.calificacionSeleccionada = this.getCalificaciones.get(0)
		this.notificarAObservadores()
	}
	
	def getEsOfensiva() {
		this.calificacionSeleccionada.esOfensiva
		
	}
	
	def setEsOfensiva(Boolean unBool) {
		this.calificacionSeleccionada.esOfensiva = unBool
		this.notificarAObservadores
	}
	
	
	def getTotalCalificacionesRegistradas() {
		administracion.totalCalificacionesRegistradas
	}
	
	def getTotalCalificacionesOfensivas() {
		administracion.totalCalificacionesOfensivas
	}
	
	def getTotalCalificacionesNoOfensivas() {
		administracion.totalCalificacionesNoOfensivas
	}
	
	protected def void notificarAObservadores() {
		firePropertyChanged(this, "calificaciones")
		firePropertyChanged(this, "totalCalificacionesRegistradas")
		firePropertyChanged(this, "totalCalificacionesOfensivas")
		firePropertyChanged(this, "totalCalificacionesNoOfensivas")
	}
	
}