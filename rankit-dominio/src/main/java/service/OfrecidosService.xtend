package service

import model.Ofrecido
import java.util.List
import serviceLimitador.OfrecidoMin
import serviceLimitador.OfrecidoRankinMin
import model.TipoOfrecido

class OfrecidosService {
	private List<OfrecidoMin> ofrecidosMin
	private List<OfrecidoRankinMin> ofrecidosRankin 
	
	
	new(){

	}
	
	def setOfrecido(Ofrecido ofrecido) {
		var OfrecidoMin nuevoOfrecido = new OfrecidoMin(ofrecido)
		ofrecidosMin.add(nuevoOfrecido)
	}
	def setOfrecidoRankin(Ofrecido ofrecido) {
		var OfrecidoRankinMin nuevoOfrecidoRankin = new OfrecidoRankinMin (ofrecido)
		ofrecidosRankin.add(nuevoOfrecidoRankin)
	}
	
	def List<OfrecidoMin> getOfrecidos(){
		ofrecidosMin
	}
	
	def List<OfrecidoRankinMin> getOfrecidosConRankin(){
		ofrecidosRankin
	}
	
	def buscar(String nombre, TipoOfrecido tipo, Integer cantCalif, Integer rankingTotal ){
		this.ofrecidosRankin.filter[ofrecidoRankinMin | (ofrecidoRankinMin.getNombreEvaluado == nombre) &&
														(ofrecidoRankinMin.getTipoEvaluado == tipo) &&
														(ofrecidoRankinMin.calificaciones >= cantCalif) &&
														(ofrecidoRankinMin.ranking >= rankingTotal)
		].toList
	}
}
