package ui

import org.uqbar.arena.windows.SimpleWindow
import appModel.RankitAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class RankitWindow extends SimpleWindow<RankitAppModel>{
	
	new(WindowOwner parent, RankitAppModel model) {
		super(parent, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		// No lo voy a usar
	}
	
	override protected addActions(Panel actionsPanel) {
		// No lo voy a usar
	}
	
	
	override createContents(Panel mainPanel) {
		this.title = "Rank-IT"
		
		new Label(mainPanel) => [
			text = "Rank-It! Modulo de administración"
			fontSize = 18
		] 
		
		new Label(mainPanel) => [
			text = "Desde este modulo vas a poder gestionar los datos y opciones de la aplicación,"
		]
		
		new Label(mainPanel) => [
			text = "como sos una persona de confianza vas a tener acceso a todo!"
		]
	
		new Label(mainPanel) => [
			text = "Siempre acordate:'Con un gran poder viene una gran responsabilidad' "
		]
		
		val Panel actionPanel = new Panel(mainPanel)
		actionPanel.layout = new HorizontalLayout
		
		new Button(actionPanel) => [
			caption = "Adm. Usuarios"
			onClick([| this.administracionDeUsuario])
			width = 150
		]
		
		new Button(actionPanel) => [
			caption = "Adm. Calificaciones"
			width = 150
		]
		
		new Button(actionPanel) => [
			caption = "Adm. Servicios"
			width = 150
		]
		
		new Button(actionPanel) => [
			caption = "Adm. Lugares"
			width = 150
		]
	}
	
	def administracionDeUsuario() {
		(new AdministracionDeUsuarioWindow(this, modelObject.adminUsuario)).open
	}
  	
}