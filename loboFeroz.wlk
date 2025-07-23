// (1) EL LOBO SOLITARIO //
object loboSolitario {
  var property calorias = 400
  
  method cantidadDeCaloriasActual() {
    return calorias
  }

  //Cuando el lobo come, sus calorías aumentan
  //(mirar aporte de cada personaje)
  method comer(personaje) {
    calorias += personaje.aporte()
  }

  //Saber si el lobo está gordo
  //(o sea, si tiene más de 200 calorías).
  method estaGordo() {
    return (calorias>200) //devuelve true o false
  }

  //Saber si el lobo está saludable
  //(o sea, tiene entre 20 y 150 calorías)
  method estaSaludable() {
    return (calorias > 20 && calorias < 150)
  }
  
  //Hacer que el lobo corra un determinado tiempo
  //(quema 2 calorías por minuto)
  method correrPor(minutos) {
    calorias -= 2 * minutos
  }

  method correrA(lugar) {
    calorias -= 2 * lugar.minutos()
  }

  //Cuando el lobo sopla una casa, pierde tantas calorías como la resistencia de la casa más
  //el peso de los ocupantes
  method soplar(casa) {
    calorias -= casa.resistencia() + casa.pesoDeOcupantes()
  }

  method destruir(casa) {
    casa.fueDestruida()
  }
}

class Chanchito {
  var property peso

  //Que el lobo se pueda comer al chanchito
  //(aporta tantas calorías como su peso dividido 10)
  method aporte() = self.peso() / 10
}


// (2) CAPERUCITA ROJA //

object caperucitaRoja {
  var property peso = 40 //kg
  var property cantidadManzanas = 5

  //Caperucita le aporta tantas calorías como su propio peso más
  //el peso de su canasta, en la que hay una cierta cantidad de manzanas
  //(cada manzana tiene 2 calorías)
  method aporte() = self.peso() + cantidadManzanas * 2
}

object abuela {
  //La abuela, está tan viejita que no le aporta ninguna caloría
  method aporte() = 0
}

//Personaje invitado: Rapunzel
object rapunzel {
  var property peso = 50 //kg
  var property largoDePelo = 2 //m

  method aporte() = self.peso() + (self.largoDePelo() * 100) //su propio peso más cada cm de su pelo
}

//El lobo, cuando va corriendo a un lugar consume calorías según lo que tarde en llegar.
//Se asume que el tiempo que demora en hacerlo depende únicamente del lugar donde vaya.
object bosque {
  var property minutos = 45
}

object casaAbuela {
  var property minutos = 50
}

// (3) LOS TRES CHANCHITOS //

class Casa {
  var property ocupantes = []
  var property estaDestruida = false
  
  method pesoDeOcupantes() = ocupantes.sum({ocup => ocup.peso()})
  method fueDestruida() {
    estaDestruida = true
  }
}

class Ocupante {
  var property peso  
}

//La casa de paja no resiste nada,
object casaDePaja inherits Casa {
  var property minutos =  2
  method resistencia() = 0
}

//la de madera tiene resistencia 5
object casaDeMadera inherits Casa {
  var property minutos =  4
  method resistencia() = 5
}

//y la de ladrillos resiste 2 por cada ladrillo
object casaDeLadrillo inherits Casa {
  var property minutos =  3
  var property cantidadDeLadrillos = 8
  method resistencia() = cantidadDeLadrillos * 2
}