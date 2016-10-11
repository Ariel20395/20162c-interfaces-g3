package controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import service.OfrecidosService

@Controller
class OfrecidosController {
	
	extension JSONUtils = new JSONUtils
	OfrecidosService ofService
	
	new(OfrecidosService ofService){
		this.ofService = ofService
	}
	
	@Get("/evaluados")
	def getEvaluados(){
		response.contentType = "application/json"
		ok(this.ofService.getOfrecidos.toJson)
		
		
	}
	
}