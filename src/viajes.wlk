import socios.*

class Viajes{
	const property idiomas=#{}
	
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method dias()
	
	method esInteresante()= idiomas.size()>1

	method esRecomendablePara(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self)and 
		not( unSocio.actividadesHechas().any ({act=>act == self}))
		/*o sino..
		 * crear metodo en socio que me diga si la actividad a realizar ya la hizo
		 * mediante contains.
		 * method realizoActividad(unaActividad){
		 * return actividadesHechas().contains(unaActividad)
		 * }
		 * quedariaaaa...
		 * method esRecomendablePara(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self)and 
		* not unSocio.realizoActividad(self)
		 * 
		 */
		
	}
	}
	
class ViajeDePlaya inherits Viajes{
	const property largoPlaya
	
	override method dias(){
		return largoPlaya/500
	}
	override method implicaEsfuerzo(){
		return largoPlaya>1200
		
	}
	override method sirveParaBroncearse()=true
}

class ExcursionACiudad inherits Viajes{
	var property atraccionesAVisitar
	
	override method dias(){
		return atraccionesAVisitar/2
	}
	override method implicaEsfuerzo(){
		return atraccionesAVisitar.between(5,8)
	}
	override method sirveParaBroncearse(){
		return false
	}
	override method esInteresante()=
	super() or atraccionesAVisitar == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
	
	override method dias(){
		return super ()+1
		
	}
	override method sirveParaBroncearse(){
		return true
	}
}

class SalidaTrekking inherits Viajes{
	var property kmSenderos
	const property diasDeSol
	
	override method dias(){
		return kmSenderos/50
	}
	override method implicaEsfuerzo(){
		return kmSenderos > 80
	}
	override method sirveParaBroncearse(){
		return (diasDeSol > 200) or 
		(diasDeSol.between(100,200) and kmSenderos>120)
		
	}
	override method esInteresante()=
	super() and diasDeSol > 140
}

class ClaseDeGimnasia{
	
	method idiomas()=#{"espaniol"}
	method dias()=1
	method implicaEsfuerzo()=true
	method sirveParaBroncearse()=false
	method esRecomendablePara(unSocio){
		return unSocio.edad().between(20,30)
	}
}

class TallerLiterario{
	const librosTrabajados=[]
	
	method idiomas()= librosTrabajados.map({unLibro=>unLibro.idioma()}).asSet()
	method dias()= librosTrabajados.size()+1
	method implicaEsfuerzo(){
		return (librosTrabajados.any({unLibro=>unLibro.cantPaginas() == 500}))or
			(librosTrabajados.all({unLibro=>unLibro.nombreAutor()})and librosTrabajados.size()>1)
		}
	method sirveParaBroncearse()=false
	method esRecomendablePara(unSocio){
		return unSocio.idioma().size() > 1
	}
}