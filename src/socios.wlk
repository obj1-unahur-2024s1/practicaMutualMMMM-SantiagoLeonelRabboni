import viajes.*
import libros.*

class Socio{
	const actividadesHechas=[]
	var property maximoActividades
	var edad
	const property idiomas=#{}
	
	method leAtrae(unaActividad)
	
	method esAdoradorDeSol(){
		return actividadesHechas.all({actividad => actividad.sirveParaBroncearse()})
	}
	method actividadesEsforzadas(){
		return actividadesHechas.filter({act=>act.implicaEsfuerzo()}).asSet()
	}
	method realizarActividad(unaActividad){
		 if(actividadesHechas.size()== maximoActividades)
		{self.error("Llego al maximo de actividades")}
		
		actividadesHechas.add(unaActividad)
		}
	}
class SocioTranquilo inherits Socio{
	
	override method leAtrae(unaActividad){
		return unaActividad.dias() >= 4
	}
}
class SocioCoherente inherits Socio{
	override method leAtrae(unaActividad){
		return (self.esAdoradorDeSol() and 
		unaActividad.sirveParaBroncearse()) or (not self.esAdoradorDeSol()and unaActividad.implicaEsfuerzo())
	}	
}
class SocioRelajado inherits Socio{
	
	override method leAtrae(unaActividad){
		idiomas.any({idioma=>idioma== unaActividad.idiomas()})
	}
}
	

	

