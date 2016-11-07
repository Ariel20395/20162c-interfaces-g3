package app

import org.uqbar.xtrest.api.XTRest
import dataDummy.RankItServiceDummy
import controller.RankItController

class RankItServiceApp {
	
	def static void main(String[] args) {
		
		var rankitService = RankItServiceDummy.crearRankItService
		
		XTRest.startInstance(new RankItController(rankitService), 9000)
	}
	
}