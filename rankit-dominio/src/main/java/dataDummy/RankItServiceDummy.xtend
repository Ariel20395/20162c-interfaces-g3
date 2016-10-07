package dataDummy

import service.RankItService
import service.UsuarioService
import service.OfrecidosService
import service.RankingService

class RankItServiceDummy {
	
	def static RankItService crearRankItService() {
		
		var usuarioService 	= new UsuarioService
		var ofrecidoService	= new OfrecidosService
		var rankingService	= new RankingService
		var rankItService 	= new RankItService
		
		var usuarios	= new RankitDummy().crearAdminUsuarioDummy.usuarios
		var ofrecidos	= new RankitDummy().crearAdminOfrecidosDummy.ofrecidosHabilitados
		var ofrecidosRanking = new RankitDummy().crearAdminOfrecidosDummy.ofrecidosHabilitados
		
		for(var int i = 0; i < usuarios.size; i++) {
			usuarioService.agregarUsuario(usuarios.get(i))
		}
		
		for(var int i = 0; i < ofrecidos.size; i++) {
			ofrecidoService.agregarOfrecido(ofrecidos.get(i))
		}
		
		for(var int i = 0; i < ofrecidosRanking.size; i++) {
			rankingService.agregarOfrecidoRankin(ofrecidosRanking.get(i))
		}
		
		rankItService.setUsuarioService  = usuarioService
		rankItService.setOfrecidoService = ofrecidoService
		rankItService.setRankingService  = rankingService
		
		return rankItService
	}
	
}