package ui

import appModel.AdminCalificacionAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout

class EliminarCalificacionWindow extends TransactionalDialog<AdminCalificacionAppModel>  {

	private String taskDescription;
	

	new(WindowOwner owner, AdminCalificacionAppModel model) {
		super(owner, model)
		
		taskDescription = "¿Esta seguro que desea eliminar calificacion?"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		mainPanel.layout = new ColumnLayout(1)
		
		new Label(mainPanel).text = "Eliminar Calificacion"
	}
	
	
	override protected void addActions(Panel actions) {
		
		new Button(actions) => [
			caption = "Aceptar"
			onClick [| this.modelObject.eliminarCalificacion; this.accept]
			setAsDefault
			disableOnError	
			width = 100
		]
		
		new Button(actions) => [
			caption = "Cancelar"
			onClick [|this.cancel]
			setAsDefault
			disableOnError
			width = 100	
		]
	}
}
	