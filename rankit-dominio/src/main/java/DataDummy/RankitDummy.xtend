package DataDummy

import administracion.AdministracionUsuario
import java.util.List
import model.Calificacion
import model.Ofrecido
import model.Usuario
import administracion.AdministracionCalificacion
import administracion.AdministracionOfrecidos
import org.joda.time.DateTime

class RankitDummy {
	
	Usuario usuario1 
	Usuario usuario2
	Usuario usuario3
	Usuario usuario4
	Usuario usuario5
	
	Ofrecido netflix 	 
	Ofrecido cablevision 
	Ofrecido telecentro  
	Ofrecido carpinteria 
	Ofrecido correoARG   
	Ofrecido cineHoyts	 
	
	Calificacion calificacion1 
	Calificacion calificacion2 
	Calificacion calificacion3 
	Calificacion calificacion4 
	Calificacion calificacion5 
	Calificacion calificacion6 
	Calificacion calificacion7 
	Calificacion calificacion8 
	Calificacion calificacion9 
	
	List<Calificacion> calificaciones
			
	new() {
<<<<<<< HEAD
	usuario1 = new Usuario("Miguel", "123456") 
	usuario2 = new Usuario("Juan", "67584")
	usuario3 = new Usuario("Paula", "339465")
	usuario4 = new Usuario("Ariel", "289925")
	usuario5 = new Usuario("German", "457249")

	
	usuario1.fechaIngreso = new DateTime(2016, 9, 1, 12, 50)
	usuario2.fechaIngreso = new DateTime(2016, 6, 10, 15, 00)
	usuario3.fechaIngreso = new DateTime(2016, 7, 4, 17, 50)
	usuario4.fechaIngreso = new DateTime(2016, 8, 29, 18, 34)
	usuario5.fechaIngreso = new DateTime(2016, 3, 9, 22, 00)
=======
		usuario1 = new Usuario("Miguel", "123456") 
		usuario2 = new Usuario("Juan", "67584")
		usuario3 = new Usuario("Paula", "339465")
		usuario4 = new Usuario("Ariel", "289925")
		usuario5 = new Usuario("German", "457249")
>>>>>>> d1aba0c40a2a24588b48afdfbd6b0e4c6c487641
		
		usuario1.fechaIngreso = new DateTime(2016, 9, 1, 12, 50)
		usuario2.fechaIngreso = new DateTime(2016, 6, 10, 15, 00)
		usuario3.fechaIngreso = new DateTime(2016, 7, 4, 17, 50)
		usuario4.fechaIngreso = new DateTime(2016, 8, 29, 18, 34)
		usuario5.fechaIngreso = new DateTime(2016, 3, 9, 22, 00)
		
		usuario1.banear
		usuario2.activar
		usuario3.activar
			
		netflix 	= new Ofrecido("Netflix")
		cablevision = new Ofrecido("Cablevisión")
		telecentro  = new Ofrecido("TeleCentro")
		carpinteria = new Ofrecido("Carpintería")
		correoARG   = new Ofrecido("CorreoArgentino")
		cineHoyts	= new Ofrecido("Hoyts General Cinema")
		
		netflix.fechaRegistro = new DateTime(2016, 9, 5, 12, 00)
		cablevision.fechaRegistro 	= new DateTime(2015, 10, 2, 15, 00)
		telecentro.fechaRegistro 	= new DateTime(2016, 1, 20, 10, 00)
		carpinteria.fechaRegistro 	= new DateTime(2016, 6, 10, 9, 00)
		correoARG.fechaRegistro		= new DateTime(2015, 9, 9, 19, 00)
		cineHoyts.fechaRegistro		= new DateTime(2015, 11, 12, 9, 00)
		
		calificacion1 = new Calificacion(8,"esto anda bien",usuario1, netflix)
		calificacion2 = new Calificacion(8,"muy caro",usuario2, cablevision)
		calificacion3 = new Calificacion(8,"ben costo, problemas con internet",usuario3, telecentro)
		calificacion4 = new Calificacion(8,"buenos precios",usuario4, carpinteria)
		calificacion5 = new Calificacion(8,"no llega a tiempo establecido",usuario5, correoARG)
		calificacion6 = new Calificacion(9, "Ningun problema con el servicio", usuario1, netflix)
		calificacion7 = new Calificacion(9, "Muy buen servicio", usuario2, cineHoyts)
		calificacion8 = new Calificacion(6, "Se corta a veces", usuario3, netflix)
		calificacion9 = new Calificacion(9, "Atención muy buena", usuario3, cineHoyts)
		
		calificaciones = #[	calificacion1, calificacion2, calificacion3, calificacion4, calificacion5,
			calificacion6, calificacion7, calificacion8, calificacion9 ]
	}

	def setCalificacionesAUsuarios() {
		usuario1.calificaciones.add(calificacion1)
		usuario1.calificaciones.add(calificacion6)
		usuario2.calificaciones.add(calificacion2)
		usuario2.calificaciones.add(calificacion7)
		usuario3.calificaciones.add(calificacion3)
		usuario3.calificaciones.add(calificacion8)
		usuario3.calificaciones.add(calificacion9)
		usuario4.calificaciones.add(calificacion4)
		usuario5.calificaciones.add(calificacion5)
	}
	
	def setCalifAOfrecidos(){
		netflix.habilitar
		netflix.agregarCalificacion(calificacion1)
		netflix.agregarCalificacion(calificacion2)
		cablevision.agregarCalificacion(calificacion2)
		telecentro.habilitar
		telecentro.agregarCalificacion(calificacion8)
		telecentro.agregarCalificacion(calificacion5)
		telecentro.agregarCalificacion(calificacion9)
		carpinteria.agregarCalificacion(calificacion8)
		correoARG.habilitar
		correoARG.agregarCalificacion(calificacion6)
		correoARG.agregarCalificacion(calificacion9)
		correoARG.agregarCalificacion(calificacion9)
		cineHoyts.agregarCalificacion(calificacion1)
		cineHoyts.agregarCalificacion(calificacion2)
		cineHoyts.agregarCalificacion(calificacion3)
		cineHoyts.agregarCalificacion(calificacion4)
	}
	
	
	def crearDummyDataCalificacion() {
		var AdministracionCalificacion administracion = new AdministracionCalificacion()
		
		administracion.setCalificaciones(calificaciones)
		administracion
	}
	
	def crearAdminUsuarioDummy() {
		var AdministracionUsuario admin = new AdministracionUsuario()
		setCalificacionesAUsuarios
		setUsuarios(admin)
		admin
	}
	
	def setUsuarios(AdministracionUsuario admin) {
		
		admin.usuarios.add(usuario1)
		admin.usuarios.add(usuario2)
		admin.usuarios.add(usuario3)
		admin.usuarios.add(usuario4)
		admin.usuarios.add(usuario5)

	}
	def crearAdminOfrecidosDummy(){
		var AdministracionOfrecidos administrador = new AdministracionOfrecidos
		setCalifAOfrecidos
		agregarServicios(administrador)
		agregarLugares(administrador)
		administrador
	}
	
	def agregarServicios(AdministracionOfrecidos ad){
		ad.agregarServicio(netflix)
		ad.agregarServicio(cablevision)
		ad.agregarServicio(telecentro)
	}
	def agregarLugares(AdministracionOfrecidos adLug){
		adLug.agregarLugar(carpinteria)
		adLug.agregarLugar(correoARG)
		adLug.agregarLugar(cineHoyts)
	}
}