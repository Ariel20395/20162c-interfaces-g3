package ui

import appModel.AdminCalificacionAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

class EliminarCalificacionWindow extends TransactionalDialog<AdminCalificacionAppModel>  {
	
	new(WindowOwner owner, AdminCalificacionAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		this.title = "Eliminar Calificacion"
		
		mainPanel.layout = new ColumnLayout(1)
		
		new Label(mainPanel).text = "¿Desea eliminar calificación?"
			
	}
		
	override protected void addActions(Panel actions) {
		
		new Button(actions) => [
			caption = "Aceptar"
			onClick [| this.modelObject.setEliminarCalificacion; this.accept]
			setAsDefault
			disableOnError	
		]
		
		new Button(actions) => [
			caption = "Cancelar"
			onClick [|this.cancel]
			setAsDefault
			disableOnError	
		]
	}

	
}