class Plaga {
  const poblacion
  
  method condicionComun() = poblacion >= 10 

}
class PlagaCucarachas inherits Plaga {
  const pesoPromedio 

  method nivelDeDanio() = poblacion / 2

  method transmiteEnfermedades() = pesoPromedio > 10 and self.condicionComun()
}

class PlagaPulgas inherits Plaga {
  
  method nivelDeDanio() = poblacion * 2

}

class PlagaGarrapatas inherits PlagaPulgas {

}

class PlagaMosquitos inherits Plaga {

  method nivelDeDanio() = poblacion

  method transmiteEnfermedades() = poblacion % 3 == 0 and self.condicionComun()
}