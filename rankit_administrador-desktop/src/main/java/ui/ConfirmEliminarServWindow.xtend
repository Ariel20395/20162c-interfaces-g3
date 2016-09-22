package ui

import appModel.AdminOfrecidosAppModel
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class ConfirmEliminarServWindow extends TransactionalDialog<AdminOfrecidosAppModel> {
	
	new(WindowOwner owner, AdminOfrecidosAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = this.titulo
		
		mainPanel.layout = new ColumnLayout(1)
		
		new Label(mainPanel).text = mensajeDeAlerta()
	}
	
	def mensajeDeAlerta() {
		"¿Desea eliminar el Servicio?"
	}
	
	def titulo() {
		"Eliminar Servicio"
	}
	
	override protected void addActions(Panel actions) {
		
		new Button(actions) => [
			caption = "Aceptar"
			onClick [| this.modelObject.administrador.eliminarOfrecido(modelObject.ofrecidoSeleccionado); this.accept]
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