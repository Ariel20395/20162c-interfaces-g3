package ui

import appModel.AdminCalificacionAppModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class AdministracionDeCalificacionWindow extends SimpleWindow<AdminCalificacionAppModel> {
	
	new(WindowOwner parent, AdminCalificacionAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Rank-IT --> Adm Calificaciones"
	}
	
}