package model

class Comparador {
	
	def static Boolean compararPorNombre(String nombreEsperado, String nombreObtenido) {
		
		if (nombreEsperado == null) {
			return true
		}
		nombreObtenido.toLowerCase().contains(nombreEsperado.toLowerCase())
	}
	
}