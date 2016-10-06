package app

import DataDummy.RankitDummy
import controller.OfrecidosController
import org.uqbar.xtrest.api.XTRest
import service.OfrecidosService

class OfrecidoApp {
	
	def static void main(String[] args) {
		
		var ofrecidosService = new OfrecidosService
		var ofrecidos = new RankitDummy().crearAdminOfrecidosDummy.ofrecidosHabilitados
		
		for(var int i = 0; i < ofrecidos.size; i++){
			ofrecidosService.agregarOfrecido(ofrecidos.get(i))
		}
		
		XTRest.startInstance(new OfrecidosController(ofrecidosService), 9000)
	}
}