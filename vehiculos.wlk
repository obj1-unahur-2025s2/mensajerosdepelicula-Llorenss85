//vehiculos
object bicicleta {
  method peso() =15
}

object camion {
  var acoplados=1
  method peso() = 500 * acoplados 
  method cambiarAcoplados(unAcoplado) {
    acoplados=unAcoplado
  } 
}
