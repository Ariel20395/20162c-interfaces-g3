package administracion

import java.util.ArrayList
import java.util.List
import model.Ofrecido
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import model.Comparador

@Accessors
@Observable

class AdministracionOfrecidos {
	
	private List<Ofrecido> servicios
	private List<Ofrecido> lugares
	
	new(){
		servicios = new ArrayList<Ofrecido>
		lugares   = new ArrayList<Ofrecido>
	}

	def void altaDeServicio(String nombre){
		/*Crea un nuevo Ofrecido con nombre "nombre" y lo guarda en la lista de "servicios"*/
		var nuevo = new Ofrecido(nombre)
		this.agregarServicio(nuevo)
		
	}
	
	def void agregarServicio(Ofrecido servicio){
		this.servicios.add(servicio)
		
	}
	
	def eliminarServicio(Ofrecido servicio){
		this.servicios.remove(servicio)
	}

	def buscaServicio(String nombre) {
		/*	Filtra la lista de servicios por nombre	*/
		this.servicios.filter[ofrecido | Comparador.compararPorNombre(nombre, ofrecido.nombre)].toList
	}
	
	def cantidadDeServicios(){
		this.servicios.size
	}	

	def cantServiciosHabilitados(){
		serviciosHabilitados.size
	}
	
	def serviciosHabilitados() {
		this.servicios.filter[it.habilitado].toList
	}
	
	def cantServiciosDeshabilitados(){
		cantidadDeServicios - cantServiciosHabilitados 
	}
	
	def void altaDeLugar(String nombre){
		/*Crea un nuevo Ofrecido con nombre "nombre" y lo guarda en la lista de "lugares" */
		var nuevo = new Ofrecido(nombre)
		this.agregarLugar(nuevo)
	}
	
	def void agregarLugar(Ofrecido lugar){
		this.getLugares.add(lugar)
	}
	
	def eliminarLugar(Ofrecido lugar){
		this.lugares.remove(lugar)
	}
	
	def buscarLugar(String nombre) {
		/*	Filtra la lista de lugares por nombre	*/
		this.servicios.filter[ofrecido | Comparador.compararPorNombre(nombre, ofrecido.nombre)].toList
	}
	
	def cantidadDeLugares(){
		this.lugares.size
	}
	
	def cantLugaresHabilitados(){
		lugaresHabilitados.size
	}
	
	def lugaresHabilitados() {
		this.lugares.filter[
			ofrecido| ofrecido.habilitado==true
		].toList
	}
	
	def cantLugaresDeshabilitados(){
		cantidadDeLugares - cantLugaresHabilitados
	}
	
	def habilitar(Ofrecido of){
		of.habilitar
	}
	
	def eliminarOfrecido(Ofrecido ofrecido) {
		if (this.lugares.contains(ofrecido)) {
			this.eliminarLugar(ofrecido)	
		}
		if (this.servicios.contains(ofrecido)) {
			this.eliminarServicio(ofrecido)	
		}
		
	}
	
}