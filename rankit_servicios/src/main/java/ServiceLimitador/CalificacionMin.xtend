package ServiceLimitador


import org.eclipse.xtend.lib.annotations.Accessors
import model.Calificacion


@Accessors

class CalificacionMin {
	
	Integer id
	Integer puntos
	String usuario
	String ofrecido
	
	
	//Constructor 
	new(Calificacion calificacion) {
		this.id = calificacion.id
		this.puntos = calificacion.puntos
		this.usuario = calificacion.nombreUsuario
		this.ofrecido = calificacion.nombreOfrecido
	}
}
