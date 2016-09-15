package model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.joda.time.DateTime
import excepciones.ExceptionUsuario
import java.util.ArrayList
import java.util.List

@Accessors
@Observable
class Usuario {
	
	private String 	 nombre
	private DateTime fechaIngreso
	private Boolean	 activo
	private Boolean  baneado
	private String 	 password
	private List<Calificacion> calificaciones
	private Integer	cantidadCalificacionesOfensivas
	
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
		this.cantidadCalificacionesOfensivas = 0
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
			new ExceptionUsuario("El usuario no debe estar baneado")
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
		/*	Se guarda la calificación en el primer lugar de la lista 	*/
		this.calificaciones.add(0, calificacion)
	}
	
	def eliminarCalificacion(Calificacion calificacion) {
		/*	Elimina una calificación de la lista de calificaciones 		*/
		this.calificaciones.remove(calificacion)
	}
	
	def sumarPublicacionOfensiva() {
		/*	Se actualiza en +1 la cantidad de publicaciones ofensivas. 
		 * 	Si el usuario llega al maximo(5), este se banea	y la cantidad
		 *	de publicaciones ofensivas vuelve a 0						*/
		if(this.cantidadCalificacionesOfensivas == 5) {
			this.banear
			this.cantidadCalificacionesOfensivas = 0
		} else {
			this.cantidadCalificacionesOfensivas ++
		}
	}
}