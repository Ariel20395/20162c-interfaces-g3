package ui

import model.Usuario
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox

class EditarWindow extends TransactionalDialog<Usuario> {
	
	new(WindowOwner owner, Usuario model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		this.title = "Editar Informacion"
		
		mainPanel.layout = new ColumnLayout(1)
		
		this.nombreActual(mainPanel)
		
		this.nombreNuevo(mainPanel)		
		
	}
	
	def nombreNuevo(Panel mainPanel) {
		
		val Panel panelHorizontal = new Panel(mainPanel)
		panelHorizontal.layout = new HorizontalLayout
		
		new Label(panelHorizontal) => [
					
			text = "Nombre nuevo: "
		]
		
		new TextBox(panelHorizontal) => [
			value <=> "nombre"
			width = 150
		]
	}
	
	protected def nombreActual(Panel mainPanel) {
		
		val Panel panelHorizontal = new Panel(mainPanel)
		panelHorizontal.layout = new HorizontalLayout
		
		new Label(panelHorizontal) => [
			
			var String nombreActual = modelObject.nombre
					
			text = "Nombre actual: " + nombreActual
		]	
	}
	
	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.accept]
			setAsDefault
			disableOnError	
		]
	}
	
}