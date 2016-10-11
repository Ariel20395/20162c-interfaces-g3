package serviceLimitador

import model.TipoOfrecido
import model.Ofrecido

class OfrecidoMin {
	String nombre
	TipoOfrecido tipo
	Integer id
	
	new(Ofrecido ofrecido){
		this.nombre = ofrecido.nombre
		this.tipo = ofrecido.tipo
		this.id = ofrecido.id
		
	}
	
}
