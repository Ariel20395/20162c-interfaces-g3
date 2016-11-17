package service

import org.eclipse.xtend.lib.annotations.Accessors
import serviceLimitador.CalificacionMin

@Accessors
class RankItService {
	
	private OfrecidosService ofrecidoService
	private UsuarioService	usuarioService
	private RankingService	rankingService
	private CalificacionesService calificacionService
	
	new() {
		
	}
	
	def getUsuarios() {
		usuarioService.getUsuarios()
	}
	
	def existeUsuarioConNombre(String nombreUsuario) {
		usuarioService.existeUsuarioConNombre(nombreUsuario)
	}
	
	def crearUsuario(String nombreUsuario, String passwordUsuario) {
		usuarioService.crearUsuario(nombreUsuario, passwordUsuario)
	}
	
	def existeUsuario(String nombreUsuario, String passwordUsuario) {
		usuarioService.existeUsuario(nombreUsuario, passwordUsuario)
	}
	
	def getNombreUsuario(String nombreUsuario) {
		usuarioService.getNombreUsuario(nombreUsuario)
	}
	
	def passwordIncorrecto(String nombreUsuario, String passwordUsuario) {
		usuarioService.passwordIncorrecto(nombreUsuario, passwordUsuario)
	}
	
	def getOfrecidos() {
		ofrecidoService.ofrecidos
	}
	
	def buscar(String nombreOfrecido, String tipo, String cantidad, String ranking) {
		rankingService.buscar(nombreOfrecido, tipo, cantidad, ranking)
	}
	
	def getCalificacionesDeUsuario(String usuario) {
		calificacionService.getCalificacionesDeUsuario(usuario)
	}
	
	def getCalificacion(Integer id) {
		calificacionService.getCalificacion(id)
	}
	
	def eliminarCalificacion(CalificacionMin calificacionMin) {
		calificacionService.eliminarCalificacion(calificacionMin)
	}
	
	def ingresoDeDatosCorrectos(Integer puntos, String detalle, String evaluado) {
		calificacionService.ingresoDeDatosCorrectos(puntos, detalle, evaluado)
	}
	
	def realizarNuevaCalificacion(Integer puntos, String detalle, String usuario, String evaluado) {
		calificacionService.realizarCalificacion(puntos, detalle, usuario, evaluado)
	}
	
	def existeCalificacion(Integer id) {
		calificacionService.existeCalificacion(id)
	}
	
	def editarCalificacionPorId(Integer id, Integer puntos, String detalle, String evaluado) {
		calificacionService.editarCalificacionPorId(id, puntos, detalle, evaluado)
	}
	
	
}