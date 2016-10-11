package CalificacionesMapTest

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import serviciosApp.CalificacionesService
import serviceLimitador.CalificacionMin
import model.Calificacion

class CalificacionesMapTest {
	CalificacionesService calificacionesService
	
	@Before def void setUp() throws Exception {
		calificacionesService = new CalificacionesService
		
	}
	
	@Test def void testAgregarCalificacion() {
		var Calificacion calificacion1 = new Calificacion(8,"detalle", "Diego", "Cablevision")
	
		calificacionesService.agregarCalificacion(calificacion1)
		
		assertEquals(1, calificacionesService.calificaciones.size)
	}
	
	
	@Test def void testEliminarCalificacion() {
		var	Calificacion calificacion1 = new Calificacion(8,"detalle", "Diego", "Cablevision")
		var CalificacionMin calificacionMin1 = new CalificacionMin(calificacion1)
		
		calificacionesService.agregarCalificacionMin(calificacionMin1)
		calificacionesService.eliminarCalificacion(calificacionMin1)
		
		assertTrue(calificacionesService.calificaciones.isEmpty)
	}
	
	@Test def void testGetCalificacionDeUsuario() {
		var	Calificacion diego = new Calificacion(8,"detalle", "Diego", "Cablevision")
		var	Calificacion miguel = new Calificacion(8,"detalle", "Miguel", "Cablevision")
		var	Calificacion javier = new Calificacion(8,"detalle", "Javier", "Cablevision")
		
		calificacionesService.agregarCalificacion(diego)
		calificacionesService.agregarCalificacion(miguel)
		calificacionesService.agregarCalificacion(javier)
		
		assertEquals(calificacionesService.getCalificacion((miguel.id)) , calificacionesService.getCalificacionesDeUsuario("Miguel").get(0))
	}
}