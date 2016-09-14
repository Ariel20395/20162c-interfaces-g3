package model
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.joda.time.DateTime

@Accessors
@Observable
class Ofrecido {
	
	private String nombre
	private DateTime fechaRegistro
	private Boolean habilitado
	
	new(String nombre){
		/*Constructor. Crea un ofrecido con Nombre. 
		 *La fecha de registro se establece automáticamente al momento de la construcción.
		 * Se crea deshabilitado por defecto.
		 */
		this.nombre = nombre
		this.fechaRegistro = DateTime.now
		this.habilitado = false
	}
	
	def void habilitar(){
		this.habilitado = true
	}	
	
	def void deshabilitar(){
		this.habilitado = false
	}
	
}