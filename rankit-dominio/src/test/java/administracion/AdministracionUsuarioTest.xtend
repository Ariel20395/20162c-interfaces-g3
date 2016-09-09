package administracion

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import model.Usuario

class AdministracionUsuarioTest {
	
	private AdministracionUsuario admin
	
	@Before
	def void init() {
		
		admin = new AdministracionUsuario
	}
	
	@Test
	def void testCreacionNuevoUsuario() {
		
		admin.crearNuevoUsuario()
		
		var Usuario usuarioEsperado = admin.usuarios.get(0)
		
		Assert.assertEquals("NN", usuarioEsperado.nombre)
		Assert.assertEquals("123", usuarioEsperado.password)
		/*	No testeo la fecha ya que por milisegundos no aserta, tampoco
		 * 	testeo si esta activo o banneado ya que por default no lo estan
		 */
	}
}