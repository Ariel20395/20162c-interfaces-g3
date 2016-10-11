package service

import java.util.ArrayList
import java.util.List
import model.Ofrecido
import model.TipoOfrecido
import serviceLimitador.OfrecidoRankinMin

class RankingService {
	
	var ofrecidosRankin = new ArrayList<OfrecidoRankinMin>  
	
	new() {
		
	}
	
	
	def void agregarOfrecidoRankin(Ofrecido ofrecido) {
		var OfrecidoRankinMin nuevoOfrecidoRankin = new OfrecidoRankinMin (ofrecido)
		ofrecidosRankin.add(nuevoOfrecidoRankin)
	}
	
	def List<OfrecidoRankinMin> getOfrecidosConRankin(){
		ofrecidosRankin
	}
	
	def buscar(String nombre, String tipo, Integer calificacionesBuscadas, Integer rankingBuscado ){
		
		this.ofrecidosRankin.filter[rankinMin |
			verificarNombre(rankinMin, nombre) &&
			verificarTipo(rankinMin, tipo) &&
			verificarCantidad(rankinMin, calificacionesBuscadas) &&
			verificarRanking(rankinMin, rankingBuscado) ].toList
	}
	
	def verificarRanking(OfrecidoRankinMin rankinMin, String rankingBuscado) {
		if(rankingBuscado == null) {
			return true
		}
		rankinMin.ranking >= rankingBuscado
	}
	
	def verificarCantidad(OfrecidoRankinMin rankinMin, String cantCalif) {
		if(verificarSiEsNullOStringVacio(cantCalif)) {
			return true
		}
		rankinMin.calificaciones >= Integer.valueOf(cantCalif)
	}
	
	def verificarTipo(OfrecidoRankinMin rankinMin, String tipo) {
		if(verificarSiEsNullOStringVacio(tipo)) {
			return true
		}
		rankinMin.tipoEvaluado == TipoOfrecido.valueOf(tipo)
	}
	
	def verificarNombre(OfrecidoRankinMin rankinMin, String nombre) {
		if(nombre == null) {
			return true
		}
		rankinMin.nombreEvaluado.contains(nombre)
	}
	
	def verificarSiEsNullOStringVacio(String propiedadBuscada) {
		return propiedadBuscada == null || propiedadBuscada == ""
	}
	
}