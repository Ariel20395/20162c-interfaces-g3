package appModel

import org.junit.Before
import administracion.AdministracionUsuario
import model.Usuario
import java.util.List
import java.util.ArrayList
import org.junit.Test
import org.junit.Assert

class AdminUsuarioAppModelTest {
	
	private AdministracionUsuario admin
	private Usuario	ariel
	private Usuario franco
	private AdminUsuarioAppModel adminAppModel
	
	@Before
	def void init(){
		admin 	= new AdministracionUsuario
		ariel 	= new Usuario("Ariel", "123456")
		franco	= new Usuario("Franco", "123456")
		
		var List<Usuario> usuariosPredeterminados = new ArrayList<Usuario>()
		usuariosPredeterminados.add(ariel)
		usuariosPredeterminados.add(franco)
		
		admin.agregarUsuario(ariel)
		admin.agregarUsuario(franco)
				
		adminAppModel = new AdminUsuarioAppModel
		adminAppModel.setAdmin(admin)
	}
	
	@Test
	def void testBusquedaDeUsuario() {
		
		adminAppModel.nombreUsuarioBuscado = "Ariel"
		
		Assert.assertEquals(#[ariel], adminAppModel.usuarios)
	}
}