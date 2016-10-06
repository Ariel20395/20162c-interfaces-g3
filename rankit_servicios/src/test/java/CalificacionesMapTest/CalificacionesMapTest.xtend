package CalificacionesMapTest

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import serviciosApp.CalificacionesService
import modelServicios.CalificacionService

class CalificacionesMapTest {
	CalificacionesService calificacionesService
	
	@Before def void setUp() throws Exception {
		calificacionesService = new CalificacionesService
		
	}
	
	@Test def void testAgregarCalificacion() {
	var	CalificacionService calificacion1 = new CalificacionService(5, 8,"detalle", "Diego", "Cablevision")
	
		calificacionesService.setCalificacion(calificacion1)
		
		assertEquals(1, calificacionesService.calificaciones.size)
	}
	
	
	@Test def void testEliminarCalificacion() {
		var	CalificacionService calificacion1 = new CalificacionService(5, 8,"detalle", "Diego", "Cablevision")
		
		calificacionesService.setCalificacion(calificacion1)
		calificacionesService.eliminarCalificacion(calificacion1)
		
		assertTrue(calificacionesService.calificaciones.isEmpty)
	}
	
	@Test def void testGetCalificacionDeUsuario() {
		
		var	CalificacionService diego = new CalificacionService(1, 8,"detalle", "Diego", "Cablevision")
		var	CalificacionService miguel = new CalificacionService(2, 8,"detalle", "Miguel", "Cablevision")
		var	CalificacionService javier = new CalificacionService(3, 8,"detalle", "Javier", "Cablevision")
		
		calificacionesService.setCalificacion(diego)
		calificacionesService.setCalificacion(miguel)
		calificacionesService.setCalificacion(javier)
		
		assertEquals(calificacionesService.getCalificacion(2) , calificacionesService.getCalificacionesDeUsuario("Miguel").get(0))
	}
}