package appModel

import org.uqbar.commons.utils.Observable
import administracion.AdministracionOfrecidos
import model.Ofrecido
import static org.uqbar.commons.model.ObservableUtils.*
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
@Observable
class AdminOfrecidosAppModel {
	
	AdministracionOfrecidos administrador
	Ofrecido ofrecidoSeleccionado
	String nombreOfrecido
	
	new(){
		administrador = new AdministracionOfrecidos
	}
	
	def List<Ofrecido> getServicios(){
		administrador.buscaServicio(nombreOfrecido)
	}
	
	def List<Ofrecido> getLugares(){
		administrador.buscarLugar(nombreOfrecido)
	}
	
	def void setNombreOfrecido(String nombre){
		this.nombreOfrecido = nombre
		firePropertyChanged(this,"servicios")
	}
	def void setNombreLugarBuscado(String nombre){
		this.nombreOfrecido = nombre
		firePropertyChanged(this,"lugares")
	} 
}