package service

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RankItService {
	
	private OfrecidosService ofrecidoService
	private UsuarioService	usuarioService
	private RankingService	rankingService
	
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
	
	def getIdUsuario(String nombreUsuario) {
		usuarioService.getIdUsuario(nombreUsuario)
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
	
	
}