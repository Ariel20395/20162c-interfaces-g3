package runnable

import org.uqbar.arena.Application
import appModel.RankitAppModel
import ui.RankitWindow

class RankitApplication extends Application {
	
	override protected createMainWindow() {
		val model = new RankitAppModel => [
			//adminUsuario.usuarios = new DummyDataAdminUsuario().crearAdminUsuarioDummy
		]
		new RankitWindow(this, model) 
	}
	
	def static void main(String[] args) {
		new RankitApplication().start()
	}
	
}