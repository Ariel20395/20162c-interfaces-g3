package model

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.List
import org.uqbar.commons.model.UserException

class UsuarioTest {
	
	private Usuario  usuario
	private Ofrecido netflix
	private Ofrecido speedy
	
	@Before
	def void init() {
		
		usuario = new Usuario("Ariel", "asd1234")
		netflix = new Ofrecido("Netflix")
		speedy	= new Ofrecido("Speedy")
		
		usuario.crearCalificacion(speedy, 2, "mala conexion")
		usuario.crearCalificacion(netflix, 4, "muy bueno")
	}

	@Test
	def void testConstructor() {
		
		Assert.assertEquals("Ariel", usuario.nombre)
		Assert.assertEquals("asd1234", usuario.password)
		Assert.assertFalse(usuario.activo)
		Assert.assertFalse(usuario.baneado)
		Assert.assertEquals(0, usuario.cantidadCalificacionesOfensivas)
		//	No testeo la fecha ya que por milisegundos no aserta
	}
	
	@Test
	def void testResetPassword() {
		usuario.resetPassword
		
		Assert.assertEquals("123", usuario.password)
	}
	
	@Test
	def void testActivarYDesactivarUsuario() {
		
		usuario.activar
		Assert.assertTrue(usuario.activo)
		
		usuario.desactivar
		Assert.assertFalse(usuario.activo)
	}
	
	@Test
	def void testBanneoUsuario() {
		
		usuario.activar
		usuario.banear
		Assert.assertTrue(usuario.baneado)
		
		/*	Al desbanear el usuario sigue inactivo	*/
		usuario.desbanear
		Assert.assertFalse(usuario.baneado)		
		Assert.assertFalse(usuario.activo)
	}
	
	@Test 
	def void testActivarUsuarioConBanneo() {
		/*	El usuario que esta baneado no puede ser activado si antes no esta
		 * 	desbaneado, si se intenta activar lanzara una excepción informando 
		 * 	que no es posible
		 */
		usuario.banear
		try {
			usuario.activar	
		} catch (UserException e) {
			
		}
		Assert.assertFalse(usuario.activo)
	}
	
	@Test
	def void testCreacionDeCalificacion() {
		
		var Calificacion calificacion1 = usuario.calificaciones.get(0)
		var Calificacion calificacion2 = usuario.calificaciones.get(1)
		
		var List<Calificacion> calificacionesEsperadas = #[calificacion1,calificacion2]
		
		Assert.assertEquals(calificacionesEsperadas, usuario.calificaciones)
	}

	@Test
	def void testEliminarCalificacion() {

		var Calificacion calificacion1 = usuario.calificaciones.get(0)
		var Calificacion calificacion2 = usuario.calificaciones.get(1)
		
		var List<Calificacion> calificacionesEsperadas = #[calificacion2]
		
		/*	Elimino una calificacion y testeo que se elimino correctamente */
		
		usuario.eliminarCalificacion(calificacion1)
				
		Assert.assertEquals(calificacionesEsperadas, usuario.calificaciones)			
	}	
	
	@Test
	def void testLlegarAlMaximoDePublicacionesOfensivas() {
		/*	Al llegar al maximo de calificaciones el usuario se banea */
		usuario.cantidadCalificacionesOfensivas = 5
		usuario.sumarPublicacionOfensiva	
		
		Assert.assertTrue(usuario.baneado)
		Assert.assertEquals(0, usuario.cantidadCalificacionesOfensivas, 0)
	}
}