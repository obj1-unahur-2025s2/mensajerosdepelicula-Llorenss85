import paquete.*
import mensajero.*
//empresa

object empresa {
  var paquetesEnviados=0
  var ganancias=0
  const mensajeros= [neo,chuckNorris]
  const paquetesPendientes=[]
  method contratarMensajero(unMensajero) {
    mensajeros.add(unMensajero)
  }
  method despedirMensajero(unMensajero) {
    mensajeros.remove(unMensajero)
  } 
  method despedirATodos() {
    mensajeros.clear()
  }
  method mensajeros() =mensajeros 
  method mensajeriaEsGrande() =mensajeros.size()>2

  method primeroPuedeEntregar(unPaquete) =unPaquete.puedeEntregarse(mensajeros.first())

  method pesoUltimoDeLaEmpresa() = mensajeros.last().peso() 


  method alMenosUnoPuedeEntregarPaquete(unPaquete) = mensajeros.any{unMensajero => unPaquete.puedeEntregarse(unMensajero)}
  method mensajerosPuedenObtenerElPaquete(unPaquete) =mensajeros.filter{unMensajero => unPaquete.puedeEntregarse(unMensajero)} 

  method mensajeriaTieneSobrePeso() = mensajeros.sum({unMensajero=> unMensajero.peso()}) / mensajeros.size()

  method enviarPaquete(unPaquete) {
    if(self.alMenosUnoPuedeEntregarPaquete(unPaquete)){
      paquetesEnviados+=1
      ganancias+=unPaquete.precio()
    }
    else{
      paquetesPendientes.add(unPaquete)
    }
  }
  method enviarLosPaquetes(unosPaquetes) {
    paquetesEnviados+=unosPaquetes.size() 
    ganancias+=unosPaquetes.map({paquetes => paquetes.precio()}).sum()   
  }

  method paqueteMasCaroPendiente() =paquetesPendientes.find( {p => p.precio() == paquetesPendientes.map({unPaquete => unPaquete.precio()}).max()}) // busca un paquete el cual se mapea con el precio y despues, esa lista de precio de cada paquete le busco el maximo

  
  method enviarPaqueteMasCaroPendiente() {
    if(mensajeros.any({unMensajero => self.paqueteMasCaroPendiente().puedeEntregarse(unMensajero)})){
      paquetesEnviados+=1
      ganancias+=self.paqueteMasCaroPendiente().precio()
      paquetesPendientes.remove(self.paqueteMasCaroPendiente())
      
    }
  } 
  method facturacion() =  ganancias * paquetesEnviados 
  method paquetesEnviados() =paquetesEnviados 
  method paquetesPendientes()=paquetesPendientes
}
