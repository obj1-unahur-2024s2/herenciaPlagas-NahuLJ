class Hogar {
  const nivelDeMugre
  const confortQueOfrece

  method esBueno() = nivelDeMugre <= confortQueOfrece / 2
}

class Huerta {
  const capacidadProduccion
  const nivel

  method esBueno() = capacidadProduccion > nivel 
}

class Mascota {
  const nivelDeSalud

  method esBueno() = nivelDeSalud > 250 
}

class Barrio{
  const property elementos

  method esCopado() = self.cantidadElementosBuenos() > self.cantidadElementosNoBuenos()

  method cantidadElementosBuenos() = elementos.count({elemento => elemento.esBueno()})

  method cantidadElementosNoBuenos() = elementos.count({elemento => not elemento.esBueno()})
}