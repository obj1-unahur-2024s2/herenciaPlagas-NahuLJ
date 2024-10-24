import plagas.*
class Hogar {
  var nivelDeMugre
  const confortQueOfrece

  method esBueno() = nivelDeMugre <= confortQueOfrece / 2

  method recibirAtaqueDe(unaPlaga){
    nivelDeMugre += unaPlaga.nivelDeDanio()
    unaPlaga.sufirEfectoDeAtaque()
  }
}

class Huerta {
  var property capacidadProduccion
  const nivel

  method esBueno() = capacidadProduccion > nivel 

  method recibirAtaqueDe(unaPlaga){
    capacidadProduccion = 
      0.max(capacidadProduccion - (unaPlaga.nivelDeDanio() + if(unaPlaga.transmiteEnfermedades()) 10 else 0))
    unaPlaga.sufirEfectoDeAtaque()
  }
}

class Mascota {
  var property nivelDeSalud

  method esBueno() = nivelDeSalud > 250 

  method recibirAtaqueDe(unaPlaga){
    const danioDeLaPlaga = if(unaPlaga.transmiteEnfermedades()) unaPlaga.nivelDeDanio() else 0
    nivelDeSalud = 0.max(nivelDeSalud - danioDeLaPlaga)
    unaPlaga.sufirEfectoDeAtaque()
  }
}

class Barrio{
  const property elementos

  method esCopado() = self.cantidadElementosBuenos() > self.cantidadElementosNoBuenos()

  method cantidadElementosBuenos() = elementos.count({elemento => elemento.esBueno()})

  method cantidadElementosNoBuenos() = elementos.count({elemento => not elemento.esBueno()})

  method hacerQueUnElementoRecibaAtaqueDe(unElemento,unaPlaga){
    if(elementos.contains(unElemento)){
      unElemento.recibirAtaqueDe(unaPlaga)
    }
  }
}