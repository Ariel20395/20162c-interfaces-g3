package model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.Date

@Accessors
@Observable
class Usuario {
	
	private String 	nombre
	private Date 	fechaIngreso
	private Boolean	activo
	private Boolean baneado
	private String 	password
	
	new(String nombre, String pass, Date fechaDeIngreso) {
		this.nombre 	= nombre
		this.password 	= pass
		this.fechaIngreso = fechaDeIngreso
		this.activo		= false
		this.baneado	= false
	}
}