package ui

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import appModel.AdminUsuarioAppModel

class EliminarWindow extends TransactionalDialog<AdminUsuarioAppModel>  {
	
	new(WindowOwner owner, AdminUsuarioAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		this.title = "Eliminar Usuario"
		
		mainPanel.layout = new ColumnLayout(1)
		
		new Label(mainPanel).text = "¿Desea eliminar Usuario?"
			
	}
		
	override protected void addActions(Panel actions) {
		
		new Button(actions) => [
			caption = "Aceptar"
			onClick [| this.modelObject.admin.eliminarUsuario(modelObject.usuarioSeleccionado); this.accept]
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