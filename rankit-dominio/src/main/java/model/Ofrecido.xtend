package model
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.joda.time.DateTime
import java.util.ArrayList
import java.util.List
import java.util.Random

@Accessors
@Observable
class Ofrecido {
	
	private String nombre
	private DateTime fechaRegistro
	private Boolean habilitado
	private List<Calificacion> calificaciones
	private TipoOfrecido tipo
	private Integer id
	
	new(String nombre,TipoOfrecido tipo){
		/*Constructor. Crea un ofrecido con Nombre. 
		 *La fecha de registro se establece automáticamente al momento de la construcción.
		 * Se crea deshabilitado por defecto.
		 */
		this.nombre = nombre
		this.fechaRegistro = DateTime.now
		this.habilitado = false
		this.calificaciones = new ArrayList<Calificacion>
		this.tipo = tipo
		this.id = new Random().nextInt(1000)
	}
	
	def void habilitar(){
		this.habilitado = true
	}	
	
	def void deshabilitar(){
		this.habilitado = false
	}
	
	def calificaciones(){
		return this.calificaciones
	}
	
	def agregarCalificacion(Calificacion calificacion){
		calificaciones.add(calificacion)	
	}
	
	def puntajeTotal(){
		var res = 0
		for(calificacion: calificaciones){
			res = res + calificacion.puntos
		}
		return res
	}
	
	def totalCalificaciones(){
		this.calificaciones.size
	
	}
	
	def puntajePromedio(){
		var res =  0
		if (this.totalCalificaciones < 1){
			return res
		}
		return this.puntajeTotal / this.totalCalificaciones 
	}
	
}