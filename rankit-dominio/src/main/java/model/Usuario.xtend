package model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.joda.time.DateTime
import excepciones.ExceptionUsuario

@Accessors
@Observable
class Usuario {
	
	private String 	 nombre
	private DateTime fechaIngreso
	private Boolean	 activo
	private Boolean  banneado
	private String 	 password
	
	new(String nombre, String pass) {
		/*	Constructor. Se crea el usuario con un nombre y password determinado. 
		 * 	La fecha de ingreso es automatica al momento de creación, y se crea
		 * 	inactivo y sin banneo	*/
		this.nombre 	= nombre
		this.password 	= pass
		this.fechaIngreso = DateTime.now
		this.activo		= false
		this.banneado	= false
	}
	
	def void resetPassword() {
		// Se pone el password por default
		this.password = "123"
	}
	
	def void activar() {
		/*	EL usuario solo puede estar activo si no esta banneado	*/
		if(! banneado) {
			this.activo = true	
		} else {
			new ExceptionUsuario("El usuario no debe estar banneado")
		}
	}
	
	def void desactivar() {
		this.activo = false
	}
	
	def void bannear() {
		/*	Al bannear un usuario, este queda automáticamente inactivo	*/
		this.banneado = true
		desactivar
	}
	
	def void desbannear() {
		this.banneado = false
	}
}