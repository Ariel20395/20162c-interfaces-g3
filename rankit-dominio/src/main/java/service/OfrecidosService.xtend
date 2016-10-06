package service

import model.Ofrecido
import java.util.List
import serviceLimitador.OfrecidoMin
import java.util.ArrayList

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
