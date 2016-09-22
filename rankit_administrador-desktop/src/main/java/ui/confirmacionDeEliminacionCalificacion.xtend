package ui

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import appModel.AdminCalificacionAppModel
import org.uqbar.arena.widgets.Button

class confirmacionDeEliminacionCalificacion extends TransactionalDialog<AdminCalificacionAppModel> {
	
	new(WindowOwner owner, AdminCalificacionAppModel model) {
		super(owner, model)
		taskDescription = "¿Esta seguro que desea eliminar calificacion?"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		this.title = "Eliminar"
	}
		
	override protected void addActions(Panel actions) {
		
		new Button(actions) => [
			caption = "Aceptar"
			onClick [| this.modelObject.administracion.eliminarCalificacion(modelObject.calificacionSeleccionada); this.accept]
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