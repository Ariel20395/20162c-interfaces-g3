package ui

import appModel.AdminOfrecidosAppModel
import org.uqbar.arena.windows.WindowOwner

class ConfirmEliminarLugarWindow extends ConfirmEliminarServWindow {
	
	new(WindowOwner owner, AdminOfrecidosAppModel model) {
		super(owner, model)
	}
	
	override def titulo() {
		"Eliminar Lugar"
	}
	
	override def mensajeDeAlerta() {
		"¿Desea eliminar el Lugar?"
	}
	
	
	
}