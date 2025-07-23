// (1) EL LOBO SOLITARIO //
object loboSolitario {
  var property calorias = 160
  
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
    return (calorias>20 && calorias<150)
  }
  
  //Hacer que el lobo corra un determinado tiempo
  //(quema 2 calorías por minuto)
  method correr(minutos) {
    calorias -= 2*minutos
  }
}

class Chanchito {
  var property peso

  //Que el lobo se pueda comer al chanchito
  //(aporta tantas calorías como su peso dividido 10)
  method aporte() {
    self.peso() / 10
  }

}

// (2) CAPEERUCITA ROJA //

//La primera parte no tengo idea de como hacerla,
//si se te ocurre algo dsp decime por wsp :)

object caperucitaRoja {
  var property peso = 50 //kg
  var property cantidadManzanas = 5

  //Caperucita le aporta tantas calorías como su propio peso más
  //el peso de su canasta, en la que hay una cierta cantidad de manzanas
  //(cada manzana tiene 2 calorías)
  method aporte() {
    self.peso() + cantidadManzanas * 2
  }
}

object abuela {
  //La abuela, está tan viejita que no le aporta ninguna caloría
  method aporte() {
    0
  }
}

//Personaje invitado: Rapunzel
object rapunzel {
  var property peso = 50 //kg
  var property largoDePelo = 5 //m

  method aporte() {
    self.peso() + (self.largoDePelo() * 100) //su propio peso más cada cm de su pelo
  }
}

//Lo de "El lobo, cuando va corriendo a un lugar consume calorías según lo que tarde en llegar.
//Se asume que el tiempo que demora en hacerlo depende únicamente del lugar donde vaya." supongo
//que está hecho en el metodo correr(minutos) del loboSolitario... Ni idea je