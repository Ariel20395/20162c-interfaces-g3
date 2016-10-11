package serviceLimitador

import model.Ofrecido
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class OfrecidoRankinMin {
	private OfrecidoMin evaluado
	private Integer ranking
	private Integer calificaciones
	
	new(Ofrecido evaluado){
		this.evaluado = new OfrecidoMin(evaluado)
		this.ranking = evaluado.puntajePromedio
		this.calificaciones = evaluado.totalCalificaciones
	}
	def nombreEvaluado(){
		evaluado.nombre
	}
	
	def tipoEvaluado(){
		evaluado.tipo
	}
}