package model

class Comparador {
	
	def static Boolean compararPorNombre(String nombreEsperado, String nombreObtenido) {
		
		if (nombreEsperado == null) {
			return true
		}
		if (nombreObtenido == null) {
			return false
		}
		nombreObtenido.toLowerCase().contains(nombreEsperado.toLowerCase())
	}
	
}