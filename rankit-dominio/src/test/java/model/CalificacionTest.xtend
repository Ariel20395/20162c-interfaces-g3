package model

import org.junit.Before
import org.junit.Test
import org.joda.time.DateTime
import org.junit.Assert

class CalificacionTest {
	
	Calificacion calificacion
	DateTime fecha
	
	@Before def void setUp() throws Exception {
		
		calificacion = new Calificacion (7, "Exelente", "Miguel", "Abasto Shopping")
		fecha = new DateTime("2016-01-20")
	}
	
	@Test def void testFechaRegistro() {
		calificacion.fechaRegistro = fecha
		
		Assert.assertEquals(fecha.toString("dd/MM/YYYY HH:mm"), calificacion.fechaRegistro)
	}
	
	//Testea que cuando se crea una calificacion esOfensiva es igual a false.
	@Test def void testEsOfensiva() {
		
		Assert.assertFalse(calificacion.esOfensiva)	
	}
	
	//Testea que cambie la calificacion de no ofensiva (esOfensiva = false) a ofenciva (esOfensiva = true)
	@Test def void testNoEsOfensiva() {
		calificacion.activarEsOfensiva
		
		Assert.assertTrue(calificacion.esOfensiva)
	}
	
	@Test def void testGetNombreUsuario() {
		
		Assert.assertEquals("Miguel", calificacion.nombreUsuario)
	}
	
	@Test def void testGetnombreOfrecido() {
		
		Assert.assertEquals("Abasto Shopping", calificacion.nombreOfrecido)
	}
	
}
