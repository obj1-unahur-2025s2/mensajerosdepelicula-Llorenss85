
//mensajeros
import vehiculos.*
object  roberto {
  var vehiculo=camion
  method peso() =90 + vehiculo.peso()  
  method cambiarVehiculo(unVehiculo) {
    vehiculo=unVehiculo
  }
 method puedeLlamar() =false 
}

object  chuckNorris{
  method peso() =80
  method puedeLlamar() =true

}

object neo {
  var credito =0
  method cargarCredito(nuevoCredito) {
    credito+=nuevoCredito
  }

  method peso() =0
  method puedeLlamar() = credito>0

}