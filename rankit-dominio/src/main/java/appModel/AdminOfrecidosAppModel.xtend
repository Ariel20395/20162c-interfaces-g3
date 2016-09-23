package appModel

import administracion.AdministracionOfrecidos
import java.util.List
import model.Ofrecido
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

import static org.uqbar.commons.model.ObservableUtils.*

@Accessors
@Observable
class AdminOfrecidosAppModel {
	
	AdministracionOfrecidos administrador
	Ofrecido ofrecidoSeleccionado
	String nombreServicio
	String nombreLugar
	
	new(){
		administrador = new AdministracionOfrecidos
	}
	
	def List<Ofrecido> getServicios(){
		administrador.buscaServicio(nombreServicio)
	}
	
	def List<Ofrecido> getLugares(){
		administrador.buscarLugar(nombreLugar)
	}
	
	def Integer getCantidadDeServicios() {
		administrador.cantidadDeServicios
	}
	
	def Integer getCantidadDeLugares() {
		administrador.cantidadDeLugares
	}
	
	def void setNombreServicio(String nombre){
		this.nombreServicio = nombre
		firePropertyChanged(this,"servicios")
	}
	def void setNombreLugar(String nombre){
		this.nombreLugar = nombre
		firePropertyChanged(this,"lugares")
	} 
	def Integer getCantLugaresHabilitados(){
		administrador.cantLugaresHabilitados
	}
	def Integer getCantLugaresDeshabilitados(){
		administrador.cantLugaresDeshabilitados
	}
	def void setCrearNuevoLugar() {
		administrador.altaDeLugar("Prueba")
		firePropertyChanged(this, "lugares")
		firePropertyChanged(this, "cantidadDeLugares")
		cambioLugarHabilitado
	}
	
	def Boolean getHabilitado() {
		this.ofrecidoSeleccionado.habilitado
	}
	
	def void setHabilitado(Boolean habilitado) {
		this.ofrecidoSeleccionado.setHabilitado(habilitado)
		cambioLugarHabilitado
	}
	
	protected def void cambioLugarHabilitado() {
		firePropertyChanged(this, "cantLugaresHabilitados")
		firePropertyChanged(this, "cantLugaresDeshabilitados")
	}
	
	def void setCrearNuevoServicio() {
		administrador.altaDeServicio("Prueba")
		firePropertyChanged(this, "servicios")
		firePropertyChanged(this, "cantidadDeServicios")
		firePropertyChanged(this, "cantidadDeServiciosDeshabilitados")
	}
	
	def void setEliminarOfrecido() {
		administrador.eliminarServicio(this.ofrecidoSeleccionado)
		firePropertyChanged(this, "lugares")
		firePropertyChanged(this, "servicios")
		firePropertyChanged(this, "cantidadDeServicios")
	}
	
}