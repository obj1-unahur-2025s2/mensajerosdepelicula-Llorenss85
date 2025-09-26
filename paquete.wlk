//paquetes
import destinos.*
object paquete {
  var destino= puenteDeBrooklyn

  var pagado=0
  method precio() = 50 
  method pago() =pagado ==self.precio()
  
  method pagar(unaCantidad) {
    pagado+=unaCantidad
  }

  method cambiarDestino(unDestino) {
    destino=unDestino
  }
  method puedeEntregarse(unMensajero) = self.pago() and destino.dejarPasar(unMensajero) 
}

object paquetito {
    var pago=true
    var destino=puenteDeBrooklyn

    method precio() =0 
    method noPago() {
      pago=false
    }
    method pago() =pago 

    method puedeEntregarse(unMensajero) = true
    method cambiarDestino(unDestino){
      destino=unDestino
    }
}

object paqueton {
  var pagado=0
  const destinos = [puenteDeBrooklyn,laMatrix]  
  method precio() = destinos.size() *100
  method pago() = pagado ==self.precio()

  method pagar(unaCantidad) {
    pagado+=unaCantidad
  }  
  method puedeEntregarse(unMensajero) =self.pago() and   destinos.all({ des => des.dejarPasar(unMensajero) })

}