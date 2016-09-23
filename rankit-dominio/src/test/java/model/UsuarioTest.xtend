package model

import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
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
	def void crearUsuarioConNombreEsCorrecto() {
		val nombreUsuario = "Jose"
		val password = "asd"
		
		var usuario = new Usuario(nombreUsuario, password)
		
		verificarUsuarioCorrecto(nombreUsuario, usuario, password)
	}
	
	protected def void verificarUsuarioCorrecto(String nombreUsuario, Usuario usuario, String password) {
		Assert.assertEquals(nombreUsuario, usuario.nombre)
		Assert.assertEquals(password, usuario.password)
		Assert.assertFalse(usuario.activo)
		Assert.assertFalse(usuario.baneado)
		Assert.assertEquals(0, usuario.cantidadCalificacionesOfensivas)
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
			Assert.fail("debia tirar error porque esta baneado")	
		} catch (UserException e) {
			Assert.assertFalse(usuario.activo)
		}
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
		val agregada = new Calificacion()
		var usuario = crearUsuarioCon(agregada)
		
		usuario.eliminarCalificacion(agregada)
				
		Assert.assertFalse(usuario.calificaciones.contains(agregada))			
	}
	
	def crearUsuarioCon(Calificacion agregada) {
		var usuario = new Usuario("","")
		usuario.agregarCalificacion(agregada)
		usuario
	}
	
	@Test
	def void unUsuarioConMuchasPublicacionesOfensivasEsBaneado() {
		for(var int i=0; i<6; i++ ){
			usuario.agregarCalificacion(crearCalificacionOfensiva())
		}
		
		Assert.assertTrue(usuario.baneado)
		Assert.assertEquals(6, usuario.cantidadCalificacionesOfensivas)
	}
	
	protected def Calificacion crearCalificacionOfensiva() {
		new Calificacion() => [ esOfensiva= true]
	}
}