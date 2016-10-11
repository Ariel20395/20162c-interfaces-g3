package serviceLimitador


import org.eclipse.xtend.lib.annotations.Accessors
import model.Calificacion


@Accessors

class CalificacionMin {
	
	Integer id
	Integer puntos
	String usuario
	String ofrecido
	String detalle
	
	
	//Constructor 
	new(Calificacion calificacion) {
		this.id = calificacion.id
		this.puntos = calificacion.puntos
		this.usuario = calificacion.usuario
		this.ofrecido = calificacion.ofrecido
		this.detalle = calificacion.detalle
	}
}
