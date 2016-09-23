package ui

import appModel.AdminOfrecidosAppModel
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class ConfirmEliminarWindow extends TransactionalDialog<AdminOfrecidosAppModel> {
	
	var String mensajeDeAlerta

	new(WindowOwner owner, AdminOfrecidosAppModel model,String mensajeDeAlerta, String titulo) {
		super(owner, model)
		this.title = titulo
		this.mensajeDeAlerta = mensajeDeAlerta
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		mainPanel.layout = new ColumnLayout(1)
		
		new Label(mainPanel).text = mensajeDeAlerta()
	}
	
	def mensajeDeAlerta() {
		return mensajeDeAlerta
	}
	
	
	override protected void addActions(Panel actions) {
		
		new Button(actions) => [
			caption = "Aceptar"
			onClick [| this.modelObject.setEliminarOfrecido; this.accept]
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