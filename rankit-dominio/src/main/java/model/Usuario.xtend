package model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.joda.time.DateTime
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.model.UserException

@Accessors
@Observable
class Usuario {
	
	private String 	 nombre
	private DateTime fechaIngreso
	private Boolean	 activo
	private Boolean  baneado
	private String 	 password
	private List<Calificacion> calificaciones
	
	Integer MAXIMA_CANTIDAD_PUBLICACIONES_OFENSIVAS=5
	
	new(String nombre, String pass) {
		/*	Constructor. Se crea el usuario con un nombre y password determinado. 
		 * 	La fecha de ingreso es automatica al momento de creación, y se crea
		 * 	inactivo y sin baneo	*/
		this.nombre 	= nombre
		this.password 	= pass
		this.fechaIngreso = DateTime.now
		this.activo		= false
		this.baneado	= false
		this.calificaciones = new ArrayList<Calificacion>()
	}
	
	def void resetPassword() {
		// Se pone el password por default
		this.password = "123"
	}

	def void activar() {
		/*	EL usuario solo puede estar activo si no esta baneado	*/
		if(! baneado) {
			this.activo = true	
		} else {
			throw new UserException("El usuario no debe estar baneado")
		}
	}
	
	def void desactivar() {
		this.activo = false
	}
	
	def void banear() {
		/*	Al banear un usuario, este queda automáticamente inactivo	*/
		this.baneado = true
		desactivar
	}
	
	def void desbanear() {
		this.baneado = false
	}
	
	def crearCalificacion(Ofrecido ofrecido, Integer puntos, String detalle) {
		/*	El usuario crea una calificación y esta se guarda en su lista de 
		 * 	calificaciones en el primer lugar	 */
		 var Calificacion nuevaCalificacion = new Calificacion(puntos, detalle, this, ofrecido)
		 this.agregarCalificacion(nuevaCalificacion)
		 
	}
	
	def agregarCalificacion(Calificacion calificacion) {
		this.calificaciones.add(0, calificacion)
		if (this.cantidadCalificacionesOfensivas > MAXIMA_CANTIDAD_PUBLICACIONES_OFENSIVAS){
			this.banear	
		}
	}
	
	def Integer getCantidadCalificacionesOfensivas(){
		this.calificaciones.filter[it.esOfensiva].size
	}
	
	def getFechaUltimaCalificacion() {
		this.getUltimaCalificacion.fechaRegistro
	}
	
	def Calificacion getUltimaCalificacion() {
		if(calificaciones.empty) {
			throw new UserException("El usuario no tiene publicaciones")
		} else {
			this.calificaciones.get(0)
		}
	}
	
	def getFechaDeIngreso() {
		this.fechaIngreso
	}
	
	def eliminarCalificacion(Calificacion calificacion) {
		this.calificaciones.remove(calificacion)
	}
	
}