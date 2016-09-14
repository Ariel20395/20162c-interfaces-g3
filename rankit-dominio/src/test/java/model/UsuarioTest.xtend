package model

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import excepciones.ExceptionUsuario


class UsuarioTest {
	
	private Usuario usuario
	
	@Before
	def void init() {
		
		usuario = new Usuario("Ariel", "asd1234")
	}

	@Test
	def void testConstructor() {
		
		Assert.assertEquals("Ariel", usuario.nombre)
		Assert.assertEquals("asd1234", usuario.password)
		Assert.assertFalse(usuario.activo)
		Assert.assertFalse(usuario.banneado)
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
		usuario.bannear
		Assert.assertTrue(usuario.banneado)
		
		/*	Al desbannear el usuario sigue inactivo	*/
		usuario.desbannear
		Assert.assertFalse(usuario.banneado)		
		Assert.assertFalse(usuario.activo)
	}
	
	@Test 
	def void testActivarUsuarioConBanneo() {
		usuario.bannear
		try {
			usuario.activar	
		} catch (ExceptionUsuario e) {
			
		}
	}
}