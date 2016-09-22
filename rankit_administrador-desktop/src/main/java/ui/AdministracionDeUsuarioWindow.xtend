package ui

import appModel.AdminUsuarioAppModel
import model.Usuario
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.SimpleWindow
import java.awt.Color
import org.uqbar.arena.windows.ErrorsPanel
import appModel.AdminCalificacionAppModel

class AdministracionDeUsuarioWindow extends SimpleWindow<AdminUsuarioAppModel>{
	
	new(WindowOwner parent, AdminUsuarioAppModel model) {
		super(parent, model)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Rank-IT --> Adm Usuarios"
		mainPanel.layout  = new ColumnLayout(1)
		
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
		
		val Panel panelDeContenido = new Panel(panel)
		panelDeContenido.layout = new HorizontalLayout
		
		this.crearTablaDeContenido(panelDeContenido)
		this.crearInteraccionDeContenido(panelDeContenido)
	}
	
	def crearInteraccionDeContenido(Panel panel) {
		
		val Panel panelVertical = new Panel(panel)
		panelVertical.layout = new VerticalLayout
		
		val Panel panelHorizontal = new Panel(panelVertical)
		panelHorizontal.layout = new HorizontalLayout
		
		
		crearResumenDeInformacion(panelHorizontal, "Nombre:", "usuarioSeleccionado.nombre", Color.BLACK).width = 200
		
		new ErrorsPanel(panelVertical, "Edita la Información")
				
		new Label(panelVertical).text = "Fecha de Registro:"
		
		new Label(panelVertical) => [
			value <=> "usuarioSeleccionado.fechaDeIngreso"
			] 
		
		this.usuarioActivo(panelVertical)
		
		this.usuarioBaneado(panelVertical)
		
		new Label(panelVertical).text = "Última calificación:"
		
		new Label(panelVertical) => [
			value <=> "usuarioSeleccionado.fechaUltimaCalificacion"
		]
		
		new Button(panelVertical) => [
			val elementoSeleccionado = new NotNullObservable("usuarioSeleccionado")
			
			caption = "Revisar Calificaciones"
			onClick([| this.revisarPublicaciones])
			bindEnabled(elementoSeleccionado)
			width = 250
		]
		
		new Button(panelVertical) => [
			val elementoSeleccionado = new NotNullObservable("usuarioSeleccionado")
			
			caption = "Blanquear clave"
			onClick([| resetPassword()])
			bindEnabled(elementoSeleccionado)
			width = 250
		]
		
		new Button(panelVertical) => [
			val elementoSeleccionado = new NotNullObservable("usuarioSeleccionado")
			
			caption = "Eliminar"
			onClick([| this.eliminarUsuario])
			bindEnabled(elementoSeleccionado)
			width = 250
		]
	}
	
	def revisarPublicaciones() {
		(new AdministracionDeCalificacionWindow(this, new AdminCalificacionAppModel => [
			administracion.calificaciones = modelObject.usuarioSeleccionado.calificaciones
			nombreUsuarioBuscado = modelObject.usuarioSeleccionado.nombre
		])).open
	}
	
	def eliminarUsuario() {
		(new EliminarWindow(this, modelObject)).open
	}
	
	def resetPassword() {
		modelObject.usuarioSeleccionado.resetPassword
		showInfo("Password reseteado. Password: 123")
	}
	
	
	def usuarioBaneado(Panel panel) {
		
		val Panel panelHorizontal = new Panel(panel)
		panelHorizontal.layout = new HorizontalLayout
		
		new CheckBox(panelHorizontal).bindValueToProperty("usuarioSeleccionado.baneado")
		
		new Label(panelHorizontal).text = "Baneado" 
	}
	
	def usuarioActivo(Panel panel) {
		
		val Panel panelHorizontal = new Panel(panel)
		panelHorizontal.layout = new HorizontalLayout
		
		new CheckBox(panelHorizontal) => [
			value <=> ("usuarioSeleccionado.activo")
		]
		
		new Label(panelHorizontal).text = "Activo" 
	}
	
	
	def crearTablaDeContenido(Panel panel) {
		
		val Panel panelVertical = new Panel(panel)
		panelVertical.layout = new VerticalLayout
		val table = new Table<Usuario>(panelVertical, typeof(Usuario)) => [
			items <=> "usuarios"
			value <=> "usuarioSeleccionado"
			numberVisibleRows = 10
		]
		this.resultadosDeTabla(table)
		
		new Button(panelVertical) => [
			caption = "Nuevo"
			onClick([| modelObject.admin.crearNuevoUsuario])
			width = 200
		]
	}
	
	def resultadosDeTabla(Table<Usuario> table) {
		
		new Column<Usuario>(table) => [
			title = "Fecha de Registro"
			fixedSize = 175
			bindContentsToProperty("fechaDeIngreso")
		]
		
		new Column<Usuario>(table) => [
			title = "Nombre"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
		
		new Column<Usuario>(table) => [
			title = "Activo"
			fixedSize = 70
			bindContentsToProperty("activo").transformer = 
			 [ Boolean activo | 
			 	if (activo) "Si" else "No"
			 ]
		]
		
		new Column<Usuario>(table) => [
			title = "Baneado"
			fixedSize = 70
			bindContentsToProperty("baneado").transformer = 
			 [ Boolean baneado | 
			 	if (baneado) "Si" else "No"
			 ]
		]
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
			width = 250
		]
	}
	
	def void crearResumenDeSituacion(Panel panel) {
		val Panel panelHorizontal = new Panel(panel)
		panelHorizontal.layout = new HorizontalLayout
		
		crearResumenDeInformacion(panelHorizontal, "Usuarios Registrados:", "admin.cantidadDeUsuarios", Color.BLUE)
		crearResumenDeInformacion(panelHorizontal, "Activos:", "admin.cantidadDeUsuariosActivos", Color.BLUE)
		crearResumenDeInformacion(panelHorizontal, "Inactivos:", "admin.cantidadDeUsuariosInactivos", Color.RED)
		crearResumenDeInformacion(panelHorizontal, "Baneados:", "admin.cantidadDeUsuariosBaneados", Color.RED)
	}
	
	def crearResumenDeInformacion(Panel panel, String nombreCampo, String cantidadDeCampo, Color color) {
		
		new Label(panel) => [
			text = nombreCampo
		]
		
		new Label(panel) => [
			value <=> cantidadDeCampo
			foreground = color
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}