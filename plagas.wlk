class Plaga {
  var property poblacion
  
  method transmiteEnfermedades() = poblacion >= 10

  method sufirEfectoDeAtaque(){
    poblacion *= 1.1
  }
}

class PlagaCucarachas inherits Plaga {
  var property pesoPromedio 

  method nivelDeDanio() = poblacion / 2

  override method transmiteEnfermedades() = super() and pesoPromedio > 10 

  override method sufirEfectoDeAtaque(){
    super()
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

  override method transmiteEnfermedades() = super() and poblacion % 3 == 0 
}