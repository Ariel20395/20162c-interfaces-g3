package ui

import org.uqbar.arena.windows.SimpleWindow
import appModel.AdminOfrecidosAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.tables.Table
import model.Ofrecido
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import java.awt.Color
import appModel.AdminCalificacionAppModel

class AdministracionDeServicioWindow extends SimpleWindow<AdminOfrecidosAppModel>{
	
	new(WindowOwner parent, AdminOfrecidosAppModel model) {
		super(parent, model)
	}
	
	override createContents(Panel mainPanel){
		this.title = "Rank-It --> Adm Servicios"
		mainPanel.layout  = new ColumnLayout(1)
		
		this.armarResumenSit(mainPanel)
		this.armarBusqueda(mainPanel)
		this.armarContenido(mainPanel)
	}
	
	def armarResumenSit(Panel mainPanel){
		new Label(mainPanel) => [
			text = "Resumen de situación:"
			fontSize = 14
		]
		this.crearResumenDeSituacion(mainPanel)
	}
	
	def generarCampoDeDatos(Panel panel, String nombreAmostrar, String valorDevuelto, Color color){
		
		new Label(panel) => [text = nombreAmostrar]
		
		new Label(panel) => [
			value <=> valorDevuelto
			foreground = color
		]
	}
	
	def void crearResumenDeSituacion(Panel panel){
		val Panel panelHorizontal = new Panel(panel)
		panelHorizontal.layout = new HorizontalLayout
		
		generarCampoDeDatos(panelHorizontal, "Servicios inscriptos:", "administrador.cantidadDeServicios", Color.BLUE)
		generarCampoDeDatos(panelHorizontal, "  Habilitados:", "administrador.cantServiciosHabilitados",Color.BLUE)
		generarCampoDeDatos(panelHorizontal, "  Desahabilitados:", "administrador.cantServiciosDeshabilitados", Color.RED)
	}

	def armarBusqueda(Panel panel) {
		
		new Label(panel) => [
			text = "Servicios"
			fontSize = 14	
		]
		
		val Panel busqueda = new Panel(panel)
		busqueda.layout = new HorizontalLayout
				
		new Label(busqueda)=> [
			text = "Buscar por nombre de servicio"
			fontSize = 10
		] 
		
		new TextBox(busqueda) => [
			value <=> "nombreOfrecido"
			width = 200
		]
	}

	
	def armarContenido(Panel panel) {
		
		val Panel panelDeContenido = new Panel(panel)
		panelDeContenido.layout = new HorizontalLayout
		
		this.crearTablaDeDespliegue(panelDeContenido)
		this.crearInteraccionDeContenido(panelDeContenido)
	}
	
	def crearTablaDeDespliegue(Panel panel){
		val Panel panelVertical = new Panel(panel)
		panelVertical.layout = new VerticalLayout
		
		val table = new Table<Ofrecido>(panelVertical, typeof (Ofrecido))=>[
			items.bindToProperty("servicios")
			value.bindToProperty("ofrecidoSeleccionado")
			numberVisibleRows = 5
		]
		this.composicionDeTabla(table)
		new Button(panelVertical)=>[
			caption = "Nuevo"
			onClick([| modelObject.administrador.altaDeServicio("nombreProvisorio")
			])
			width = 50
		]
	}
	def composicionDeTabla(Table<Ofrecido> table){
		new Column<Ofrecido>(table)=>[
			title = "Fecha de Registro"
			fixedSize = 150 
			bindContentsToProperty("fechaRegistro")
		]
		new Column<Ofrecido>(table)=>[
			title = "Nombre"
			fixedSize = 120
			bindContentsToProperty("nombre")
		]
		new Column<Ofrecido>(table)=>[
			title = "Habilitado"
			fixedSize = 100 
			bindContentsToProperty("habilitado").transformer = 
				[Boolean habilitado | if (habilitado) "Si" else "No"]
		]
	}
	def crearInteraccionDeContenido(Panel panel){
		val Panel panelVertical = new Panel (panel)
		panelVertical.layout = new ColumnLayout(1)
		
		val Panel panelHorizontal = new Panel(panelVertical)
		panelHorizontal.layout = new HorizontalLayout
		
		generarCampoDeDatos(panelHorizontal, "Nombre:", "ofrecidoSeleccionado.nombre", Color.BLACK).width = 200
		
		new Label (panelVertical)=>[
			text = "Edita la información"
			fontSize = 11
			background = Color.WHITE
			width = 200
			height = 25
			]
		
		new Label (panelVertical).text = "Nombre"
		new TextBox (panelVertical)=>[
			bindValueToProperty("ofrecidoSeleccionado.nombre")
			width = 200
			]
		
		this.ofrecidoHabilitado(panelVertical)
		
		generarCampoDeDatos(panelVertical, "Rating Promedio:", "ofrecidoSeleccionado.puntajePromedio", Color.GRAY)
		generarCampoDeDatos(panelVertical, "Calificaciones:", "ofrecidoSeleccionado.totalCalificaciones", Color.GRAY)
		
		
		new Button(panelVertical)=>[
			val elemSeleccionado = new NotNullObservable("ofrecidoSeleccionado")
			caption = "Revisar Calificaciones"
			onClick([|this.verCalificaciones])
			bindEnabled(elemSeleccionado)
			width = 250
		]
		
		new Button(panelVertical)=>[
			val elemSeleccionado = new NotNullObservable("ofrecidoSeleccionado")
			caption = "Eliminar"
			onClick([| this.eliminarServicio])
			bindEnabled(elemSeleccionado)
			width = 250
		]
	}
	def eliminarServicio() {
		(new ConfirmEliminarServWindow (this, modelObject)).open
	}
		
	def verCalificaciones() {
		 (new AdministracionDeCalificacionWindow(this, new AdminCalificacionAppModel)).open	
	}
	
		def ofrecidoHabilitado(Panel panel) {
		
		val Panel panelHorizontal = new Panel(panel)
		panelHorizontal.layout = new HorizontalLayout
		
		new CheckBox(panelHorizontal).bindValueToProperty("ofrecidoSeleccionado.habilitado")
		
		new Label(panelHorizontal).text = "Habilitado" 
	}
	
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
}