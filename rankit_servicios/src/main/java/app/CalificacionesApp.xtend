package app

import administracion.CalificacionesMap
import model.Usuario
import model.Calificacion
import model.Ofrecido
import org.joda.time.DateTime
import org.uqbar.xtrest.api.XTRest
import controller.CalificacionController
import model.TipoOfrecido

class CalificacionesApp {
	
	def static void main(String[] args) {
		
		var calificaciones = new CalificacionesMap
		
		var usuario1 = new Usuario("Miguel", "123456")
		var usuario2 = new Usuario("Juan", "67584")
		var usuario3 = new Usuario("Paula", "339465")
		var usuario4 = new Usuario("Ariel", "289925")
		var usuario5 = new Usuario("German", "457249")

		usuario1.fechaIngreso = new DateTime(2016, 9, 1, 12, 50)
		usuario2.fechaIngreso = new DateTime(2016, 6, 10, 15, 00)
		usuario3.fechaIngreso = new DateTime(2016, 7, 4, 17, 50)
		usuario4.fechaIngreso = new DateTime(2016, 8, 29, 18, 34)
		usuario5.fechaIngreso = new DateTime(2016, 3, 9, 22, 00)

		usuario1.banear
		usuario2.activar
		usuario3.activar
		
		
		
		
		var netflix = new Ofrecido("Netflix", TipoOfrecido.SERVICIO)
		var cablevision = new Ofrecido("Cablevisión", TipoOfrecido.SERVICIO)
		var telecentro = new Ofrecido("TeleCentro", TipoOfrecido.SERVICIO)
		var carpinteria = new Ofrecido("Carpintería", TipoOfrecido.LUGAR)
		var correoARG = new Ofrecido("CorreoArgentino", TipoOfrecido.LUGAR)
		var cineHoyts = new Ofrecido("Hoyts General Cinema", TipoOfrecido.LUGAR)
		
		

		netflix.fechaRegistro = new DateTime(2016, 9, 5, 12, 00)
		cablevision.fechaRegistro = new DateTime(2015, 10, 2, 15, 00)
		telecentro.fechaRegistro = new DateTime(2016, 1, 20, 10, 00)
		carpinteria.fechaRegistro = new DateTime(2016, 6, 10, 9, 00)
		correoARG.fechaRegistro = new DateTime(2015, 9, 9, 19, 00)
		cineHoyts.fechaRegistro = new DateTime(2015, 11, 12, 9, 00)
		
		usuario1.crearCalificacion(netflix, 8, "muy bueno")
		usuario2.crearCalificacion(cablevision, 5, "algo caro")

		var calificacion1 = new Calificacion(8, "esto anda bien", usuario1, netflix)
		var calificacion2 = new Calificacion(8, "muy caro", usuario2, cablevision)
		var calificacion3 = new Calificacion(8, "buen costo, problemas con internet", usuario3, telecentro)
		var calificacion4 = new Calificacion(8, "buenos precios", usuario4, carpinteria)
		var calificacion5 = new Calificacion(8, "no llega a tiempo establecido", usuario5, correoARG)
		var calificacion6 = new Calificacion(9, "Ningun problema con el servicio", usuario1, netflix)
		var calificacion7 = new Calificacion(9, "Muy buen servicio", usuario2, cineHoyts)
		var calificacion8 = new Calificacion(6, "Se corta a veces", usuario3, netflix)
		var calificacion9 = new Calificacion(9, "Atención muy buena", usuario3, cineHoyts)
		calificacion9.esOfensiva = true
		
		
		calificaciones.setCalificacion(1, calificacion1)
		calificaciones.setCalificacion(2, calificacion2)
		calificaciones.setCalificacion(3, calificacion3)
		calificaciones.setCalificacion(4, calificacion4)
		calificaciones.setCalificacion(5, calificacion5)
		calificaciones.setCalificacion(6, calificacion6)
		calificaciones.setCalificacion(7, calificacion7)
		calificaciones.setCalificacion(8, calificacion8)
		calificaciones.setCalificacion(9, calificacion9)
			
		
		XTRest.startInstance(new CalificacionController(calificaciones), 9000)
	}
}