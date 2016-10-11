package administracion

import static org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import model.Calificacion
import java.util.List


class AdministracionCalificacionTest {
	AdministracionCalificacion administracionCalificacion
	Calificacion calificacion1
	Calificacion calificacion2

	
	@Before def void setUp() throws Exception {
		administracionCalificacion = new AdministracionCalificacion()
		calificacion1 = new Calificacion(5, "mucha espera para la atencion","Juan" , "Pizzeria La Plata")
		calificacion2 = new Calificacion(8, "Buena señal","Marcos" , "Personal")
		
		administracionCalificacion.agregarCalificacion(calificacion1)
		administracionCalificacion.agregarCalificacion(calificacion2)
	}

	//Dada una lista de caificaciones con dos calificaciones, le pido su total de calificaiones registradas y responde 2.
	@Test def void testAgregarCalificacion() {
		
		assertEquals(2, administracionCalificacion.totalCalificacionesRegistradas)
	}
	
	//Elimino la calificacion1 y verifico su cantidad de calificaiones sea 1 y que no contenga la lista a calificacion1
	@Test def void testEliminarCalificacion() {
		administracionCalificacion.eliminarCalificacion(calificacion1)
		
		
		assertEquals(1, administracionCalificacion.totalCalificacionesRegistradas)
		assertTrue(administracionCalificacion.calificaciones.contains(calificacion2))
		assertFalse(administracionCalificacion.calificaciones.contains(calificacion1))	
	}
	
	//Cambio la calificacion1 a esOfensiva = true y cuando le pregunto la cantidad de calificaciones ofensiva responde 1
	@Test def void testTotalCalificacionesOfensivas() {
		calificacion1.activarEsOfensiva
		
		assertEquals(1, administracionCalificacion.totalCalificacionesOfensivas)
	}
	
	@Test def void BuscarUsuario() {
		var List<Calificacion> calificacion = #[calificacion2]
		
		assertEquals(calificacion, administracionCalificacion.buscarCalificacion("Marcos", null))
	}
}
