package CalificacionesMapTest

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import administracion.CalificacionesMap
import model.Calificacion

class CalificacionesMapTest {
	CalificacionesMap calificacionesMap
	
	@Before def void setUp() throws Exception {
		calificacionesMap = new CalificacionesMap
		
	}
	
	@Test def void testAgregarCalificacion() {
	var	Calificacion calificacion1 = new Calificacion(8,"detalle", "Diego", "Cablevision")
	
		calificacionesMap.setCalificacion(1, calificacion1 )
		
		assertEquals(1, calificacionesMap.calificaciones.size)
	}
	
	
	@Test def void testEliminarCalificacion() {
		var	Calificacion calificacion1 = new Calificacion(8,"detalle", "Diego", "Cablevision")
		
		calificacionesMap.setCalificacion(1, calificacion1 )
		calificacionesMap.eliminarCalificacion(1)
		
		assertTrue(calificacionesMap.calificaciones.isEmpty)
	}
	
	@Test def void testGetCalificacionDeUsuario() {
		
		var	Calificacion diego = new Calificacion(8,"detalle", "Diego", "Cablevision")
		var	Calificacion miguel = new Calificacion(8,"detalle", "Miguel", "Cablevision")
		var	Calificacion javier = new Calificacion(8,"detalle", "Javier", "Cablevision")
		
		calificacionesMap.setCalificacion(1, diego)
		calificacionesMap.setCalificacion(2, miguel)
		calificacionesMap.setCalificacion(3, javier)
		
		assertEquals(calificacionesMap.getCalificacion(2) , calificacionesMap.getCalificacionesDeUsuario("Miguel"))
	}
}