package model

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.List

class OfrecidoTest {
	
		private Ofrecido aysa
		private Ofrecido freddo
		private Calificacion cal1
		private Calificacion cal2
		private Usuario user
		
		@Before
		def void setUp(){
			
			aysa = new Ofrecido("Aysa")
			freddo = new Ofrecido("Freddo")
			user = new Usuario("Juan", "007")
			cal1 = new Calificacion(8, "Bueno", user, aysa)
			cal2 = new Calificacion (4, "Regular", user, aysa)
			
		}
		
		
		@Test
		def void testConstructorOfrecido(){
			
			aysa.habilitar
			
			Assert.assertTrue(aysa.habilitado)
			Assert.assertFalse(freddo.habilitado)
		}
		
		@Test
		def void testPuntosYPromedioDeCalificaciones(){
			
			val List<Calificacion> lista = #[cal1,cal2]
			
			aysa.agregarCalificacion(cal1)
			aysa.agregarCalificacion(cal2)
			
			Assert.assertEquals(12, aysa.puntajeTotal,0)
			Assert.assertEquals(6, aysa.puntajePromedio,0)
			Assert.assertEquals(aysa.calificaciones(), lista)
				
		}
}