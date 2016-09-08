package administracion

import org.junit.Before
import org.junit.Test
import java.util.Date
import org.junit.Assert
import model.Usuario

class AdministracionUsuarioTest {
	
	private AdministracionUsuario admin
	private Date fecha
	
	@Before
	def void init() {
		
		admin = new AdministracionUsuario
		fecha = new Date(2016, 9, 8, 14, 00)
	}
	
	@Test
	def void testCreacionUsuario() {
		
		admin.crearNuevoUsuario("NN", "123", fecha)
		
		var Usuario usuarioEsperado = admin.usuarios.get(0)
		
		Assert.assertEquals("NN", usuarioEsperado.nombre)
		Assert.assertEquals("123", usuarioEsperado.password)
		Assert.assertEquals(fecha, usuarioEsperado.fechaIngreso)
		Assert.assertFalse(usuarioEsperado.activo)
		Assert.assertFalse(usuarioEsperado.baneado)
	}
}