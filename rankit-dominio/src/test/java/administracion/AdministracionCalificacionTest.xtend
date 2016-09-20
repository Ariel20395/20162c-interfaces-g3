package administracion

import static org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import model.Calificacion
import model.Usuario
import model.Ofrecido

class AdministracionCalificacionTest {
	AdministracionCalificacion administracionCalificacion
	Calificacion calificacion1
	Calificacion calificacion2
	Usuario usuario1
	Usuario usuario2
	Ofrecido ofrecido1
	Ofrecido ofrecido2
	
	
	@Before def void setUp() throws Exception {
		administracionCalificacion = new AdministracionCalificacion()
		usuario1 = new Usuario("Juan", "456242")
		ofrecido1 = new Ofrecido("Pizzeria La Plata")
		calificacion1 = new Calificacion(5, "mucha espera para la atencion",usuario1 , ofrecido1)
		usuario2 = new Usuario("Marcos", "fkhsdig8")
		ofrecido2 = new Ofrecido("Personal")
		calificacion2 = new Calificacion(8, "Buena señal",usuario2 , ofrecido2)
		
	}

	@Test def void test() {
		
		fail("Not yet implemented")
	}
}
