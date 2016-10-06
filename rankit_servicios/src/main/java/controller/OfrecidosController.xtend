package controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import service.OfrecidosService
import model.TipoOfrecido

@Controller
class OfrecidosController {
	
	extension JSONUtils = new JSONUtils
	OfrecidosService ofService
	
	new(OfrecidosService ofServi){
		this.ofService = ofServi
	}
	
	@Get("/evaluados")
	def getEvaluados(){
		response.contentType = "application/json"
		ok(this.ofService.getOfrecidos.toJson)
	}
	
	@Get("/ranking")
	def buscarEvaluados(String nombre, String tipo, String cantCalif, String ranking){
		response.contentType = "application/json"
		var tipoOfrecido = TipoOfrecido. valueOf(tipo)
		var calificaciones = Integer.valueOf(cantCalif)
		var rankingCalif = Integer.valueOf(ranking)
		ok(ofService.buscar(nombre, tipoOfrecido, calificaciones, rankingCalif).toJson)
		
	}
	
}