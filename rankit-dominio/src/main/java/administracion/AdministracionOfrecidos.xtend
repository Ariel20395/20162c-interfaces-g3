package administracion

import java.util.ArrayList
import java.util.List
import model.Ofrecido
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import model.Comparador
import model.TipoOfrecido

@Accessors
@Observable

class AdministracionOfrecidos {
	
	private List<Ofrecido> ofrecidos
	
	new(){
		ofrecidos = new ArrayList<Ofrecido>
	}

	def void altaDeServicio(String nombre){
		var nuevo = new Ofrecido(nombre, TipoOfrecido.SERVICIO)
		this.agregarOfrecido(nuevo)
		
	}
	
	def void agregarOfrecido(Ofrecido servicio){
		this.ofrecidos.add(servicio)
		
	}
	def List<Ofrecido> getLugares(){
		this.ofrecidos.filter[ofrecido | ofrecido.tipo == TipoOfrecido.LUGAR ].toList
	}
	def List<Ofrecido> getServicios(){
		this.ofrecidos.filter[ofrecido | ofrecido.tipo == TipoOfrecido.SERVICIO].toList
	}

	def buscaServicio(String nombre) {
		/*	Filtra la lista de servicios por nombre	*/
		this.servicios.filter[ofrecido | Comparador.compararPorNombre(nombre, ofrecido.nombre)].toList
	}
	
	def cantidadDeServicios(){
		this.getServicios.size
	}	

	def cantServiciosHabilitados(){
		serviciosHabilitados.size
	}
	
	def serviciosHabilitados() {
		this.getServicios.filter[it.habilitado].toList
	}
	
	def cantServiciosDeshabilitados(){
		cantidadDeServicios - cantServiciosHabilitados 
	}
	
	def void altaDeLugar(String nombre){
		var nuevo = new Ofrecido(nombre, TipoOfrecido.LUGAR)
		this.agregarOfrecido(nuevo)
	}
	
	def buscarLugar(String nombre) {
		/*	Filtra la lista de lugares por nombre	*/
		this.servicios.filter[ofrecido | Comparador.compararPorNombre(nombre, ofrecido.nombre)].toList
	}
	
	def cantidadDeLugares(){
		this.getLugares.size
	}
	
	def cantLugaresHabilitados(){
		lugaresHabilitados.size
	}
	
	def lugaresHabilitados() {
		this.getLugares.filter[
			ofrecido| ofrecido.habilitado].toList
	}
	
	def cantLugaresDeshabilitados(){
		cantidadDeLugares - cantLugaresHabilitados
	}
	
	def habilitar(Ofrecido of){
		of.habilitar
	}
	
	def eliminarOfrecido(Ofrecido ofrecido) {
		this.ofrecidos.remove(ofrecido)
	}
	def List<Ofrecido> ofrecidosHabilitados(){
		this.ofrecidos.filter[ofrecido | ofrecido.habilitado].toList
	}
	
}