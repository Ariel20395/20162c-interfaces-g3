package runnable

import DataDummy.RankitDummy
import appModel.RankitAppModel
import org.uqbar.arena.Application
import ui.RankitWindow

class RankitApplication extends Application {
	
	override protected createMainWindow() {
		val model = new RankitAppModel => [
			adminUsuario.admin = new RankitDummy().crearAdminUsuarioDummy
			adminCalificacion.administracion = new RankitDummy().crearDummyDataCalificacion
			]
		new RankitWindow(this, model) 
	}
	
	def static void main(String[] args) {
		new RankitApplication().start()
	}
	
}