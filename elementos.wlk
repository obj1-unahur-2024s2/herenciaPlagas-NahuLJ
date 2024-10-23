import plagas.*
class Hogar {
  var nivelDeMugre
  const confortQueOfrece

  method esBueno() = nivelDeMugre <= confortQueOfrece / 2

  method recibirAtaqueDe(unaPlaga){
    nivelDeMugre += unaPlaga.nivelDeDanio()
  }
}

class Huerta {
  var capacidadProduccion
  const nivel

  method esBueno() = capacidadProduccion > nivel 

  method recibirAtaqueDe(unaPlaga){
    capacidadProduccion = 
      0.max(capacidadProduccion - (unaPlaga.nivelDeDanio() + if(unaPlaga.transmiteEnfermedades()) 10 else 0))
  }
}

class Mascota {
  var nivelDeSalud

  method esBueno() = nivelDeSalud > 250 

  method recibirAtaqueDe(unaPlaga){
    const danioDeLaPlaga = if(unaPlaga.transmiteEnfermedades()) unaPlaga.nivelDeDanio() else 0
    nivelDeSalud = 0.max(nivelDeSalud - danioDeLaPlaga)
  }
}

class Barrio{
  const property elementos

  method esCopado() = self.cantidadElementosBuenos() > self.cantidadElementosNoBuenos()

  method cantidadElementosBuenos() = elementos.count({elemento => elemento.esBueno()})

  method cantidadElementosNoBuenos() = elementos.count({elemento => not elemento.esBueno()})
}