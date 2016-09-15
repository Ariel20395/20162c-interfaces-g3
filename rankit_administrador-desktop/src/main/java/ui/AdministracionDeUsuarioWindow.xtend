package ui

import org.uqbar.arena.windows.SimpleWindow
import appModel.AdminUsuarioAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label

class AdministracionDeUsuarioWindow extends SimpleWindow<AdminUsuarioAppModel>{
	
	new(WindowOwner parent, AdminUsuarioAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Rank-IT --> Adm Usuarios"
		
		new Label(mainPanel) => [
			text = "Resumen de situación:"
			fontSize = 14
		]
	}
	
}