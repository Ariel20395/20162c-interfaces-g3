package administracion

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import model.Usuario
import java.util.List
import java.util.ArrayList

class AdministracionUsuarioTest {
	
	private AdministracionUsuario admin
	private Usuario	ariel
	private Usuario franco
	private Usuario eze
	
	@Before
	def void init() {
		
		admin 	= new AdministracionUsuario
		ariel 	= new Usuario("Ariel", "123456")
		franco	= new Usuario("Franco", "123456")
		eze		= new Usuario("Eze", "123456")
		
		var List<Usuario> usuariosPredeterminados = new ArrayList<Usuario>()
		usuariosPredeterminados.add(ariel)
		usuariosPredeterminados.add(franco)
		usuariosPredeterminados.add(eze)
		
		admin.usuarios = usuariosPredeterminados
	}
	
	@Test
	def void testCreacionNuevoUsuario() {
		
		admin.crearNuevoUsuario()
		
		var Usuario usuarioEsperado = admin.usuarios.get(3)
		
		Assert.assertEquals("NN", usuarioEsperado.nombre)
		Assert.assertEquals("123", usuarioEsperado.password)
		/*	No testeo la fecha ya que por milisegundos no aserta, tampoco
		 * 	testeo si esta activo o banneado ya que por default no lo estan
		 */
	}
	
	@Test
	def void testBuscarUsuario() {
				
		var List<Usuario> usuariosEsperados = #[ariel]
		
		Assert.assertEquals(usuariosEsperados, admin.buscarUsuario("Ariel"))
	}
	
	@Test
	def void testEliminarUsuario() {
		
		admin.eliminarUsuario(ariel)
		
		var List<Usuario> usuariosEsperados = #[franco, eze]
		
		Assert.assertEquals(usuariosEsperados, admin.usuarios)
	}
	
}