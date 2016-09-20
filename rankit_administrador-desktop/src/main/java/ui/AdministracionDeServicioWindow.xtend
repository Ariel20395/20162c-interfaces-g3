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

class AdministracionDeServicioWindow extends SimpleWindow<AdminOfrecidosAppModel>{
	
	new(WindowOwner parent, AdminOfrecidosAppModel model) {
		super(parent, model)
	}
	
	override createContents(Panel mainPanel){
		this.title = "Rank-It --> Adm Lugares"
		mainPanel.layout  = new ColumnLayout(1)
		
		this.armarResumenSit(mainPanel)
		this.armarContenido(mainPanel)
	}
	
	def armarResumenSit(Panel mainPanel){
		new Label(mainPanel) => [
			text = "Resumen de situación:"
			fontSize = 14
		]
		this.crearResumenDeSituacion(mainPanel)
	}
	
	def generarCampoDeDatos(Panel panel, String nombreAmostrar, String valorDevuelto){
		
		new Label(panel) => [text = nombreAmostrar]
		
		new Label(panel) => [value.bindToProperty(valorDevuelto)]
	}
	
	def void crearResumenDeSituacion(Panel panel){
		val Panel panelHorizontal = new Panel(panel)
		panelHorizontal.layout = new HorizontalLayout
		
		generarCampoDeDatos(panelHorizontal, "Servicios inscriptos:", "administrador.cantidadDeServicios")
		generarCampoDeDatos(panelHorizontal, "Habilitados:", "administrador.cantServiciosHabilitados")
		generarCampoDeDatos(panelHorizontal, "Desahabilitados:", "administrador.cantServiciosDeshabilitados")
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
			fontSize = 12
		] 
		
		new TextBox(busqueda) => [
			value.bindToProperty("nombreOfrecido")
			width = 250
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
			onClick([| modelObject.administrador.altaDeServicio("nombreProvisorio")])
			width = 200
		]
	}
	def composicionDeTabla(Table<Ofrecido> table){
		new Column<Ofrecido>(table)=>[
			title = "Fecha de Registro"
			fixedSize = 200 
			bindContentsToProperty("fechaRegistro")
		]
	}
	def crearInteraccionDeContenido(Panel panel){
		val Panel panelVertical = new Panel (panel)
		panelVertical.layout = new ColumnLayout(1)
		
		val Panel panelHorizontal = new Panel(panelVertical)
		panelHorizontal.layout = new HorizontalLayout
		
		generarCampoDeDatos(panelHorizontal, "Nombre:", "ofrecidoSeleccionado.nombre").width = 300
		
		new Button(panelVertical)=>[
			val elemSeleccionado = new NotNullObservable("ofrecidoSeleccionado")
			caption = "Edita la información"
			bindEnabled(elemSeleccionado)
			width = 250 
		]
		
		new Label (panelVertical).text = "Nombre"
		new Label (panelVertical).bindValueToProperty("ofrecidoSeleccionado.nombre")
		
		this.ofrecidoHabilitado(panelVertical)
		
		new Label(panelVertical).text = "Rating promedio:"
		new Label(panelVertical).bindValueToProperty("ofrecidoSeleccionado.puntajePromedio")
		
		new Label(panelVertical).text = "Calificaciones"
		new Label(panelVertical).bindValueToProperty("ofrecidoSeleccionado.totalCalificaciones")
		
		new Button(panelVertical)=>[
			val elemSeleccionado = new NotNullObservable("ofrecidoSeleccionado")
			caption = "Revisar Calificaciones"
			bindEnabled(elemSeleccionado)
			width = 250
		]
		
		new Button(panelVertical)=>[
			val elemSeleccionado = new NotNullObservable("ofrecidoSeleccionado")
			caption = "Eliminar"
			//onClick([| modelObject.
			bindEnabled(elemSeleccionado)
			width = 250
		]
		
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