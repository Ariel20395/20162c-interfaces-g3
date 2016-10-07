package service

import java.util.ArrayList
import java.util.List
import model.Ofrecido
import serviceLimitador.OfrecidoMin

class OfrecidosService {
	
	var ofrecidosMin = new ArrayList<OfrecidoMin>()
	
	new(){

	}
	
	def void agregarOfrecido(Ofrecido ofrecido) {
		var OfrecidoMin nuevoOfrecido = new OfrecidoMin(ofrecido)
		ofrecidosMin.add(nuevoOfrecido)
	}
	
	def List<OfrecidoMin> getOfrecidos(){
		ofrecidosMin
	}
	
}
