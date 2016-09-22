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
	
	def void setNombreServicio(String nombre){
		this.nombreServicio = nombre
		firePropertyChanged(this,"servicios")
	}
	def void setNombreLugar(String nombre){
		this.nombreLugar = nombre
		firePropertyChanged(this,"lugares")
	} 
}