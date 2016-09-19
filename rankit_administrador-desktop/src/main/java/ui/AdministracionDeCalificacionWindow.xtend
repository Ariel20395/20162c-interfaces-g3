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


class AdministracionDeCalificacionWindow extends SimpleWindow<AdminCalificacionAppModel> {
	
	new(WindowOwner parent, AdminCalificacionAppModel model) {
		super(parent, model)
	}
	
	
	
	override createContents(Panel mainPanel) {
		new Panel(mainPanel) => [
		this.title = "Rank-IT --> Adm Calificaciones"
		
		panelResumenDeSituacion(it)
		panelDeCalificaciones(it)
		panelTablaDeCalificaciones(it)
		
		]
	}
	
	def titulo(Panel miPanel, String unTitulo) {
		new Panel(miPanel) => [
		new Label(it) => [text = unTitulo
							   fontSize = 14 ]
							   
							   ]
	}
	
	def contarCalificaciones(Panel miPanel, String titulo, String binding ) {
		new Panel(miPanel) => [
		new Label(it) => [text = titulo]
		new Label(it).value <=> binding
							  ]
	}
	
	def panelTablaDeCalificaciones(Panel miPanel) {
			val table = new Table<Calificacion>(miPanel, typeof(Calificacion)) => [
				items <=> "calificaciones"
				value <=> "calificacionSeleccionada"
			]
		this.descripcionDeLaTabla(table)
	}
	
	def descripcionDeLaTabla(Table<Calificacion> table){
		new Column<Calificacion>(table) => [
			title = "Evaluado"
			fixedSize = 200
			bindContentsToProperty("nombreEvaluado")
		]
		
		new Column<Calificacion>(table) => [
			title = "Ptos"
			fixedSize = 200
			bindContentsToProperty("puntos")
		]
		
		new Column<Calificacion>(table) => [
			title = "Fecha"
			fixedSize = 200
			bindContentsToProperty("fechaRegistro")
		]
		
		new Column<Calificacion>(table) => [
			title = "User"
			fixedSize = 200
			bindContentsToProperty("nombreUsuario")
		]
		
		new Column<Calificacion>(table) => [
			title = "Es Ofensiva"
			fixedSize = 200
			bindContentsToProperty("esOfensiva").transformer = 
			 [ Boolean esOfensiva | 
			 	if (esOfensiva) "Si" else "No"
			 ]
			
		]
		
	}
	
	def panelResumenDeSituacion(Panel miPanel) {
		new Panel(miPanel) => [
			layout = new HorizontalLayout
			titulo(it, "Resumen de situación:")
		]
		new Panel(miPanel) => [
		layout = new HorizontalLayout
		contarCalificaciones(it,"Calificaciones Registradas: ", "administracion.totalCalificacionesRegistradas")
		contarCalificaciones(it, "Ofensivas: ", "administracion.totalCalificacionesOfensivas")
							  
							  ]
	}
	
	def panelDeCalificaciones(Panel miPanel) {
		new Panel(miPanel) => [
			layout = new HorizontalLayout
			titulo(it, "Calificaciones")
		]
		new Panel(miPanel) => [
			layout = new HorizontalLayout
			
			
			
		]
	}
	
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}