package administracion

import org.junit.Before
import org.junit.Test
import model.Ofrecido
import org.junit.Assert
import java.util.List
import model.TipoOfrecido

class AdministracionOfrecidosTest {
	
	private AdministracionOfrecidos administrador
	private AdministracionOfrecidos administradorCon2LugaresY1Servicio
	private Ofrecido lugSushi
	private Ofrecido lugFreddo
	private Ofrecido servSpeedy
	private Ofrecido servAysa
	
	
	@Before
	def void init(){
		administrador = new AdministracionOfrecidos
		administradorCon2LugaresY1Servicio = new AdministracionOfrecidos
		lugSushi = new Ofrecido("Sushi Pop", TipoOfrecido.LUGAR)
		lugFreddo = new Ofrecido ("Fredo", TipoOfrecido.LUGAR)
		servSpeedy = new Ofrecido("Speedy", TipoOfrecido.SERVICIO)
		servAysa = new Ofrecido("Aysa", TipoOfrecido.SERVICIO)	
		administradorCon2LugaresY1Servicio.agregarOfrecido(servSpeedy)
		administradorCon2LugaresY1Servicio.agregarOfrecido(servAysa)
		administradorCon2LugaresY1Servicio.agregarOfrecido(lugFreddo)
		
		
	}
	
	@Test
	def void testDarDeAltaUnNuevoLugarAlAdministrador(){
		administrador.altaDeLugar("Starbucks")
		
		Assert.assertEquals(1, administrador.cantidadDeLugares(),0)
		Assert.assertNotEquals(1, administrador.cantidadDeServicios(), 0)
		Assert.assertEquals(0, administrador.cantidadDeServicios(), 0)
		Assert.assertEquals("Starbucks", (administrador.lugares.get(0)).nombre)	
	}
	
	@Test
	def void testDarDeAltaNuevoServicioAlAdministrador(){
		administrador.altaDeServicio("Metrogas")
		administrador.altaDeServicio("Edesur")
		
		Assert.assertEquals(0, administrador.cantidadDeLugares(),0)
		Assert.assertEquals(2, administrador.cantidadDeServicios(), 0)
		Assert.assertEquals("Metrogas", (administrador.servicios.get(0)).nombre)
		Assert.assertEquals("Edesur", (administrador.servicios.get(1)).nombre)
	}
	
	@Test
	def void testHabilitarServicioYLugarYCantidadesHabilitadosYDesHabilitados(){
		administradorCon2LugaresY1Servicio.habilitar(servSpeedy)
		
		Assert.assertEquals(1, administradorCon2LugaresY1Servicio.cantServiciosDeshabilitados, 0)
		Assert.assertEquals(1, administradorCon2LugaresY1Servicio.cantServiciosHabilitados,0)
		Assert.assertEquals(2, administradorCon2LugaresY1Servicio.cantidadDeServicios, 0)
		Assert.assertTrue(servSpeedy.habilitado)
		Assert.assertFalse(servAysa.habilitado)
		Assert.assertEquals(1, administradorCon2LugaresY1Servicio.cantLugaresDeshabilitados, 0)
		Assert.assertEquals(0, administradorCon2LugaresY1Servicio.cantLugaresHabilitados,0)
		Assert.assertFalse(lugFreddo.habilitado)
	}
	
	@Test
	def void testEliminarLugarYServicio(){
		
		var List<Ofrecido> listaEsperadaEnServicio = #[servSpeedy]
		var List<Ofrecido> listaEsperadaEnLugar = #[]
		
		administradorCon2LugaresY1Servicio.eliminarOfrecido(lugFreddo)
		administradorCon2LugaresY1Servicio.eliminarOfrecido(servAysa)
		
		Assert.assertArrayEquals(listaEsperadaEnServicio, administradorCon2LugaresY1Servicio.servicios)
		Assert.assertArrayEquals(listaEsperadaEnLugar, administradorCon2LugaresY1Servicio.lugares)

	}
	
	@Test
	def void testBuscarServicioYLugar(){
		
		var List<Ofrecido> listaEsperadaEnServicio = #[servAysa]
		var List<Ofrecido> listaEsperadaEnLugar = #[]
		
		Assert.assertArrayEquals(listaEsperadaEnServicio, administradorCon2LugaresY1Servicio.buscaServicio("Aysa"))
	    Assert.assertArrayEquals(listaEsperadaEnLugar, administradorCon2LugaresY1Servicio.buscarLugar("Starbucks"))
	}
}