class Plaga {
  var property poblacion
  
  method transmiteEnfermedades() = self.condicionDeTransmision()

  method condicionDeTransmision() = poblacion >= 10

  method sufirEfectoDeAtaque(){
    self.efectoDeAtaque()
  }

  method efectoDeAtaque(){
    poblacion *= 1.1
  }

}
class PlagaCucarachas inherits Plaga {
  var property pesoPromedio 

  method nivelDeDanio() = poblacion / 2

  override method transmiteEnfermedades() = pesoPromedio > 10 and self.condicionDeTransmision()

  override method sufirEfectoDeAtaque(){
    self.efectoDeAtaque()
    pesoPromedio += 2
  }
}

class PlagaPulgas inherits Plaga {
  
  method nivelDeDanio() = poblacion * 2
}

class PlagaGarrapatas inherits PlagaPulgas {

  override method sufirEfectoDeAtaque(){
    poblacion *= 1.2
  }
}

class PlagaMosquitos inherits Plaga {

  method nivelDeDanio() = poblacion

  override method transmiteEnfermedades() = poblacion % 3 == 0 and self.condicionDeTransmision()
}