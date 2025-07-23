// (1) LOBO FEROZ //
object loboFeroz {
  var property calorias = 160
  
  method cantidadDeCaloriasActual() {
    return calorias
  }
  
  //Que el lobo se pueda comer al chanchito
  //(aporta tantas calorías como su peso dividido 10)
  method comerChanchito() {
    calorias += Chanchito.peso() / 10
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

}