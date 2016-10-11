package service

import model.Ofrecido
import java.util.List
import serviceLimitador.OfrecidoMin

class OfrecidosService {
	private List<OfrecidoMin> ofrecidosMin
	
	
	new(){

	}
	
	def setOfrecido(Ofrecido ofrecido) {
		var OfrecidoMin nuevoOfrecido = new OfrecidoMin(ofrecido)
		ofrecidosMin.add(nuevoOfrecido)
	}
	
	def List<OfrecidoMin> getOfrecidos(){
		ofrecidosMin
	}
}
