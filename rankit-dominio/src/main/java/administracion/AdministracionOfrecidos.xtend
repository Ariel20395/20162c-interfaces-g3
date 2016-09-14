package administracion

import java.util.ArrayList
import java.util.List
import model.Ofrecido
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

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
		this.getServicios.add(servicio)
		
	}
	
	def void altaDeLugar(String nombre){
		/*Crea un nuevo Ofrecido con nombre "nombre" y lo guarda en la lista de "lugares" */
		var nuevo = new Ofrecido(nombre)
		this.agregarLugar(nuevo)
	}
	
	def void agregarLugar(Ofrecido lugar){
		this.getLugares.add(lugar)
	}
	
	
	
}