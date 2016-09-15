package DataDummy

import model.Calificacion
import model.Usuario
import java.util.ArrayList
import java.util.List
import model.Ofrecido

class RankitDummy {
	
		
		
	var Usuario usuario1 = new Usuario("Miguel", "123456")
	var Usuario usuario2 = new Usuario("Juan", "67584")
	var Usuario usuario3 = new Usuario("Paula", "339465")
	var Usuario usuario4 = new Usuario("Ariel", "289925")
	var Usuario usuario5 = new Usuario("German", "457249")
	
	
	var Ofrecido ofrecido1 = new Ofrecido("Nexflic")
	var Ofrecido ofrecido2 = new Ofrecido("Cablevisión")
	var Ofrecido ofrecido3 = new Ofrecido("TeleCentro")
	var Ofrecido ofrecido4 = new Ofrecido("Carpintería")
	var Ofrecido ofrecido5 = new Ofrecido("CorreoArgentino")
	
	var Calificacion calificacion1 = new Calificacion(8,"esto anda bien",usuario1, ofrecido1)
	var Calificacion calificacion2 = new Calificacion(8,"muy caro",usuario2, ofrecido2)
	var Calificacion calificacion3 = new Calificacion(8,"ben costo, problemas con internet",usuario3, ofrecido3)
	var Calificacion calificacion4 = new Calificacion(8,"buenos precios",usuario4, ofrecido4)
	var Calificacion calificacion5 = new Calificacion(8,"no llega a tiempo establecido",usuario5, ofrecido5)
	
	var List<Calificacion> calificaciones = #[calificacion1, calificacion2, calificacion3, calificacion4, calificacion5]

	def crearDummyDataCalificacion() {
		calificaciones
	}
}