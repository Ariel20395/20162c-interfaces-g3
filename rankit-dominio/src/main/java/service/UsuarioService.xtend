package service

import java.util.ArrayList
import model.Usuario
import serviceLimitador.UsuarioMin
import java.util.HashMap

class UsuarioService {
	
	var usuarios = new ArrayList<UsuarioMin>()
	
	new() {
		
	}
	
	def getUsuarios() {
		/*	Retorna los usuarios	*/
		this.usuarios
	}
	
	def void agregarUsuario(Usuario usuario) {
		var UsuarioMin usuarioMin = new UsuarioMin(usuario)
		this.usuarios.add(usuarioMin)
	}
	
	def void crearUsuario(String nombre, String password) {
		var Usuario usuario = new Usuario(nombre, password)
		var UsuarioMin usuarioNuevo = new UsuarioMin(usuario) 
		usuarios.add(usuarioNuevo)
	}
	
	def existeUsuarioConNombre(String nombreUsuario) {
		usuarios.exists[usuario | usuario.nombre == nombreUsuario]
	}
	
	
	def existeUsuario(String nombreUsuario, String pass) {
		usuarios.exists[usuario | 
			usuario.nombre 	 == nombreUsuario &&
			usuario.password == pass
		]
	}
	
	def getIdUsuario(String nombreUsuario) {
		var map = new HashMap<String, Integer>()
		map.put("id", getUsuario(nombreUsuario).id)
		map
	}
	
	def getUsuario(String nombreUsuario) {
		usuarios.findFirst[usuario | usuario.nombre == nombreUsuario]
	}
	
	def passwordIncorrecto(String nombreUsuario, String pass) {
		getUsuario(nombreUsuario).password != pass
	}
	
}
