package DataDummy

import administracion.AdministracionUsuario
import java.util.List
import model.Calificacion
import model.Ofrecido
import model.Usuario
import administracion.AdministracionCalificacion

class RankitDummy {
			
	var Usuario usuario1 = new Usuario("Miguel", "123456")
	var Usuario usuario2 = new Usuario("Juan", "67584")
	var Usuario usuario3 = new Usuario("Paula", "339465")
	var Usuario usuario4 = new Usuario("Ariel", "289925")
	var Usuario usuario5 = new Usuario("German", "457249")
	
	
	var Ofrecido netflix 	 = new Ofrecido("Netflix")
	var Ofrecido cablevision = new Ofrecido("Cablevisión")
	var Ofrecido telecentro  = new Ofrecido("TeleCentro")
	var Ofrecido carpinteria = new Ofrecido("Carpintería")
	var Ofrecido correoARG   = new Ofrecido("CorreoArgentino")
	var Ofrecido cineHoyts	 = new Ofrecido("Hoyts General Cinema")
	
	var Calificacion calificacion1 = new Calificacion(8,"Anda muy bien,
   pero tendrian que poner mas temporadas de las series
   y tambien hacer la app compatible con linux",usuario1, netflix)
	var Calificacion calificacion2 = new Calificacion(8,"muy caro",usuario2, cablevision)
	var Calificacion calificacion3 = new Calificacion(8,"ben costo, problemas con internet",usuario3, telecentro)
	var Calificacion calificacion4 = new Calificacion(8,"buenos precios",usuario4, carpinteria)
	var Calificacion calificacion5 = new Calificacion(8,"no llega a tiempo establecido",usuario5, correoARG)
	var Calificacion calificacion6 = new Calificacion(9, "Ningun problema con el servicio", usuario1, netflix)
	var Calificacion calificacion7 = new Calificacion(9, "Muy buen servicio", usuario2, cineHoyts)
	var Calificacion calificacion8 = new Calificacion(6, "Se corta a veces", usuario3, netflix)
	var Calificacion calificacion9 = new Calificacion(9, "Atención muy buena", usuario3, cineHoyts)
	
	var List<Calificacion> calificaciones = #[
		calificacion1, calificacion2, calificacion3, calificacion4, calificacion5,
		calificacion6, calificacion7, calificacion8, calificacion9
	]

	def setCalificacionesAUsuarios() {
		usuario1.calificaciones.add(calificacion1)
		usuario1.calificaciones.add(calificacion6)
		
		usuario2.calificaciones.add(calificacion2)
		usuario2.calificaciones.add(calificacion7)
		
		usuario3.calificaciones.add(calificacion3)
		usuario3.calificaciones.add(calificacion8)
		usuario3.calificaciones.add(calificacion9)
		
		usuario4.calificaciones.add(calificacion4)
		
		usuario5.calificaciones.add(calificacion5)
	}
	
	def crearDummyDataCalificacion() {
		var AdministracionCalificacion administracion = new AdministracionCalificacion()
		
		administracion.setCalificaciones(calificaciones)
		administracion
	}
	
	def crearAdminUsuarioDummy() {
		var AdministracionUsuario admin = new AdministracionUsuario()
		setCalificacionesAUsuarios
		setUsuarios(admin)
		admin
	}
	
	def setUsuarios(AdministracionUsuario admin) {
		
		admin.usuarios.add(usuario1)
		admin.usuarios.add(usuario2)
		admin.usuarios.add(usuario3)
		admin.usuarios.add(usuario4)
		admin.usuarios.add(usuario5)

	}
}