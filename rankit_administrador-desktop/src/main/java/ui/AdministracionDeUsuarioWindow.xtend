package ui

import appModel.AdminUsuarioAppModel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.Window

class AdministracionDeUsuarioWindow extends Window<AdminUsuarioAppModel>{
	
	new(WindowOwner parent, AdminUsuarioAppModel model) {
		super(parent, model)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Rank-IT --> Adm Usuarios"
		mainPanel.layout = new ColumnLayout(1)
		
		this.crearResumen(mainPanel)
		
		this.crearBusqueda(mainPanel)
		
		this.crearContenido(mainPanel)
	}
	
	def crearResumen(Panel mainPanel) {
		new Label(mainPanel) => [
			text = "Resumen de situación:"
			fontSize = 14
		]
		
		this.crearResumenDeSituacion(mainPanel)
	}
	
	def crearContenido(Panel panel) {
		
		val Panel divisionDeContenido = new Panel(panel)
		divisionDeContenido.layout = new ColumnLayout(2)
		
	//	this.crearTablaDeContenido(divisionDeContenido)
	//	this.crearInteraccionDeContenido(divisionDeContenido)
	}
	
	def crearBusqueda(Panel panel) {
		
		new Label(panel) => [
			text = "Usuarios"
			fontSize = 14	
		]
		
		val Panel busqueda = new Panel(panel)
		busqueda.layout = new HorizontalLayout
				
		new Label(busqueda)=> [
			text = "Buscar por nombre de usuario"
			fontSize = 12
		] 
		
		new TextBox(busqueda) => [
			value <=> "nombreUsuarioBuscado"
		]
	}
	
	def void crearResumenDeSituacion(Panel panel) {
		val Panel resumen = new Panel(panel)
		resumen.layout = new HorizontalLayout
		
		crearResumenDeUsuarios(resumen, "Usuarios Registrados:", "admin.cantidadDeUsuarios")
		crearResumenDeUsuarios(resumen, "Activos:", "admin.cantidadDeUsuariosActivos")
		crearResumenDeUsuarios(resumen, "Inactivos:", "admin.cantidadDeUsuariosInactivos")
		crearResumenDeUsuarios(resumen, "Baneados:", "admin.cantidadDeUsuariosBaneados")
	}
	
	def crearResumenDeUsuarios(Panel panel, String nombreCampo, String cantidadDeCampo) {
		
		new Label(panel) => [
			text = nombreCampo
		]
		
		new Label(panel) => [
			value <=> cantidadDeCampo
			width = 20
		]
	}
	
}