package ui

import appModel.RankitAppModel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class RankitWindow extends Window<RankitAppModel>{
	
	new(WindowOwner parent, RankitAppModel model) {
		super(parent, model)
	}

	
	override createContents(Panel mainPanel) {
		this.title = "Rank-IT"
		mainPanel.layout = new ColumnLayout(1)
		
		new Label(mainPanel) => [
			text = "Rank-It! Modulo de administración"
			fontSize = 18
		] 
		
		new Label(mainPanel).text = "Desde este modulo vas a poder gestionar los datos y opciones de la aplicación,"
		
		new Label(mainPanel).text = "como sos una persona de confianza vas a tener acceso a todo!"
	
		new Label(mainPanel).text = "Siempre acordate:'Con un gran poder viene una gran responsabilidad' "
		
		val Panel actionPanel = new Panel(mainPanel)
		actionPanel.layout = new HorizontalLayout
		
		botonAdministracionUsuario(actionPanel)
		
		botonAdministracionCalificacion(actionPanel)
		
		botonAdministracionServicio(actionPanel)
		
		botonAdministracionLugares(actionPanel)
		
	}
	
	def botonAdministracionLugares(Panel actionPanel) {
		
		val Panel panelVertical = new Panel(actionPanel)
		panelVertical.layout = new VerticalLayout
		
		new Button(panelVertical) => [
			caption = "Adm. Lugares"
			onClick([| this.administracionDeLugar])
			width = 150
		]
		
		val Panel panelHorizontal = new Panel(panelVertical)
		panelHorizontal.layout = new HorizontalLayout
		
		this.agregarInformacion(panelHorizontal, "adminOfrecidos.administrador.cantLugaresHabilitados",
			"adminOfrecidos.administrador.cantidadDeLugares")
	}
	
	
	def botonAdministracionServicio(Panel actionPanel) {
		
		val Panel panelVertical = new Panel(actionPanel)
		panelVertical.layout = new VerticalLayout
		
		new Button(panelVertical) => [
			caption = "Adm. Servicios"
			onClick([| this.administracionDeServicio])
			width = 150
		]
		
		val Panel panelHorizontal = new Panel(panelVertical)
		panelHorizontal.layout = new HorizontalLayout
		
		this.agregarInformacion(panelHorizontal, "adminOfrecidos.administrador.cantServiciosHabilitados",
			"adminOfrecidos.administrador.cantidadDeServicios")
	}
	
	def botonAdministracionCalificacion(Panel actionPanel) {
		
		val Panel panelVertical = new Panel(actionPanel)
		panelVertical.layout = new VerticalLayout
		
		new Button(panelVertical) => [
			caption = "Adm. Calificaciones"
			onClick([| this.administracionDeCalificacion])
			width = 150
		]
		
		val Panel panelHorizontal = new Panel(panelVertical)
		panelHorizontal.layout = new HorizontalLayout
		
		this.agregarInformacion(panelHorizontal, "adminCalificacion.administracion.totalCalificacionesNoOfensivas",
			"adminCalificacion.administracion.totalCalificacionesRegistradas")
	}
	
	def botonAdministracionUsuario(Panel mainPanel) {
		
		val Panel panelVertical = new Panel(mainPanel)
		panelVertical.layout = new VerticalLayout
		
		new Button(panelVertical) => [
			caption = "Adm. Usuarios"
			onClick([| this.administracionDeUsuario])
			width = 150
		]
		
		val Panel panelHorizontal = new Panel(panelVertical)
		panelHorizontal.layout = new HorizontalLayout
		
		this.agregarInformacion(panelHorizontal, "adminUsuario.admin.cantidadDeUsuariosActivos",
			"adminUsuario.admin.cantidadDeUsuarios") => [
				new Label(panelHorizontal).text = "(" 
				new Label(panelHorizontal).bindValueToProperty("adminUsuario.admin.cantidadDeUsuariosBaneados")
				new Label(panelHorizontal).text = ")"
			]
	}
	
	def agregarInformacion(Panel panel, String binding1, String binding2) {
		
		new Label(panel) => [ value <=> binding1 ]
		new Label(panel).text = "/"
		new Label(panel) => [ value <=> binding2 ]
	}
	
	def administracionDeUsuario() {
		(new AdministracionDeUsuarioWindow(this, modelObject.adminUsuario)).open
	}
	
	def administracionDeCalificacion() {
		(new AdministracionDeCalificacionWindow(this, modelObject.adminCalificacion)).open
	}
	
	def administracionDeServicio() {
		(new AdministracionDeServicioWindow(this, modelObject.adminOfrecidos)).open
	}
	
	def administracionDeLugar(){
		(new AdministracionDeLugarWindow(this, modelObject.adminOfrecidos)).open
	}
  	
}