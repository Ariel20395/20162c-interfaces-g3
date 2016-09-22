package ui

import appModel.AdminCalificacionAppModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout
import model.Calificacion
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import java.awt.Color
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.KeyWordTextArea
import org.uqbar.arena.widgets.NumericField
<<<<<<< HEAD
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.bindings.NotNullObservable
=======
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.VerticalLayout
>>>>>>> d1aba0c40a2a24588b48afdfbd6b0e4c6c487641

class AdministracionDeCalificacionWindow extends SimpleWindow<AdminCalificacionAppModel> {
	
	
	new(WindowOwner parent, AdminCalificacionAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	
	override createContents(Panel mainPanel) {
		new Panel(mainPanel) => [
		this.title = "Rank-IT --> Adm Calificaciones"
		
		panelResumenDeSituacion(it)
		panelDeCalificaciones(it)
		panelTablaEInformacion(it)
		
		]
	}
	
	def panelTablaEInformacion(Panel miPanel) {
		new Panel(miPanel) => [
			layout = new HorizontalLayout
			
			val panelIzquierdo = new Panel(it) => [
			layout = new VerticalLayout
			panelTablaDeCalificaciones(it)
			]
			
			val panelDerecho = new Panel(it) => [
			layout = new VerticalLayout
			panelDeInformacion(it)
			]
		]
		
	}
	
	def panelDeInformacion(Panel miPanel) {
		new Panel(miPanel) => [
			
			new Label (it)=>[
			text = "Edita la información"
			background = Color.WHITE
			width = 200
			]
			
			
			subtitulo(it, "Evaluado")
			new TextBox(it) => [
				value <=> "calificacionSeleccionada.nombreEvaluado"
			]
			
			infoHorizontalConLabel(it,"Fecha: ", "calificacionSeleccionada.fechaRegistro" )
			infoHorizontalConLabel(it, "Usuario: ", "calificacionSeleccionada.nombreUsuario")
			
			subtitulo(it, "Puntaje:")
			new NumericField(it) => [
				value <=> "calificacionSeleccionada.puntos"
			]
			
			subtitulo(it, "Detalle")
			new KeyWordTextArea(it) => [
				value <=> "calificacionSeleccionada.detalle"
				width = 250
				height = 50
				multiLine = true
			]
			
<<<<<<< HEAD
			calificaionOfensiva(it)
			
			new Button(it) => [
			val calificacion = new NotNullObservable("calificacionSeleccionada")
			caption = "Eliminar"
			onClick([| this.eliminarCalificacion()])
			bindEnabled(calificacion)
			width = 250
		]
		]
	}
	
	def calificaionOfensiva(Panel miPanel) {
=======
			habilitado(it)
			
			new Button(it)=>[
				val elemSeleccionado = new NotNullObservable("calificacionSeleccionada")
				caption = "Eliminar"
				onClick([| this.eliminarCalificacion])
				bindEnabled(elemSeleccionado)
				width = 250
			]
		]
	}
	
	def eliminarCalificacion() {
		(new EliminarCalificacionWindow (this, modelObject)).open
	}
	
	
	
	def habilitado(Panel miPanel) {
>>>>>>> d1aba0c40a2a24588b48afdfbd6b0e4c6c487641
		new Panel(miPanel) => [
			layout = new HorizontalLayout
			new CheckBox(it) => [
				value <=> "calificacionSeleccionada.esOfensiva"
			]
			subtitulo(it, "Contenido Ofensivo")
		]
	}
	
	
	
	def panelResumenDeSituacion(Panel miPanel) {
		new Panel(miPanel) => [
			layout = new HorizontalLayout
			titulo(it, "Resumen de situación:")
			
		]
		new Panel(miPanel) => [
			layout = new HorizontalLayout
			contarCalificaciones(it,"Calificaciones Registradas: ", "administracion.totalCalificacionesRegistradas", Color.BLUE)
			contarCalificaciones(it, "Ofensivas: ", "administracion.totalCalificacionesOfensivas", Color.RED)
	   	]
	}
	
	
	def panelDeCalificaciones(Panel miPanel) {
		new Panel(miPanel) => [
			layout = new HorizontalLayout
			titulo(it, "Calificaciones")
		]
		new Panel(miPanel) => [
			layout = new HorizontalLayout
			subtitulo(it, "Usuario")
			busqueda(it, "nombreUsuarioBuscado")
			subtitulo(it, "Evaluado")
			busqueda(it, "nombreOfrecidoBuscado")
		]
	}
	
	
	def busqueda(Panel busquedaPanel, String unBinding) {
		new Panel(busquedaPanel) => [
			layout = new HorizontalLayout
		new TextBox(it) => [
			value <=> unBinding
			width = 200
		]
		]
	}
	
	
	def panelTablaDeCalificaciones(Panel miPanel) {
			val table = new Table<Calificacion>(miPanel, typeof(Calificacion)) => [
				items <=> "calificaciones"
				value <=> "calificacionSeleccionada"
				numberVisibleRows = 10
			]
		this.descripcionDeLaTabla(table)
		
		new Panel(miPanel) => [ 
		new Button(it) => [
			caption = "Nuevo"
			onClick([| modelObject.administracion.nuevaCalificacion])
		]
		]
	}
	
	def descripcionDeLaTabla(Table<Calificacion> table){
		new Column<Calificacion>(table) => [
			title = "Evaluado"
			fixedSize = 150
			bindContentsToProperty("nombreEvaluado")
		]
		
		new Column<Calificacion>(table) => [
			title = "Ptos"
			fixedSize = 50
			bindContentsToProperty("puntos")
		]
		
		new Column<Calificacion>(table) => [
			title = "Fecha"
			fixedSize = 150
			bindContentsToProperty("fechaRegistro")
		]
		
		new Column<Calificacion>(table) => [
			title = "User"
			fixedSize = 100
			bindContentsToProperty("nombreUsuario")
		]
		
		new Column<Calificacion>(table) => [
			title = "Es Ofensiva"
			fixedSize = 90
			bindContentsToProperty("esOfensiva").transformer = 
			 [ Boolean esOfensiva | 
			 	if (esOfensiva) "Si" else "No"]	
		]
	}
	
	
	def titulo(Panel miPanel, String unTitulo) {
		new Panel(miPanel) => [
		new Label(it) => [text = unTitulo
							   fontSize = 14 ]
							  ]
	}
	
	def subtitulo(Panel miPanel, String unSubtitulo) {
		new Panel(miPanel) => [
			new Label(it) => [text = unSubtitulo]
		]
	}
	
						
	def contarCalificaciones(Panel miPanel, String titulo, String binding, Color unColor ) {
		new Panel(miPanel) => [
		layout = new HorizontalLayout
		new Label(it) => [text = titulo]
		new Label(it) => [value <=> binding
			foreground = unColor]
							  ]
	}
	
	def infoHorizontalConLabel(Panel miPanel, String unSubtitulo, String binding) {
		new Panel(miPanel) => [
		layout = new HorizontalLayout
			subtitulo(it, unSubtitulo)
			new Label(it) => [
				value <=> binding
			]
		]	
	}
	def eliminarCalificacion() {
		(new confirmacionDeEliminacionCalificacion (this, modelObject)).open
	}
	
}