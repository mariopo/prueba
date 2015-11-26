//: Playground - noun: velocimetroAutomovilDigital
//: Swift Mini Reto No. 2
//: Autor: Mario Porras
//: Fecha: 24-nov-2015

import UIKit

let apagado = 0
let velocidadBaja = 20
let velocidadMedia = 50
let velocidadAlta = 120
let rangoVelocidadBaja = 1...20
let rangoVelocidadMedia = 21...50
let rangoVelocidadAlta = 51...120


enum Velocidades : Int{
    case Apagado = 0, VelocidadBaja = 20, VelocidadMedia = 50, VelocidadAlta = 120
    
    init(velocidadInicial : Int){
        switch velocidadInicial{
        case apagado:
            self = .Apagado
        case rangoVelocidadBaja:
            self = .VelocidadBaja
        case rangoVelocidadMedia:
            self = .VelocidadMedia
        case rangoVelocidadAlta:
            self = .VelocidadAlta
        default:
            self = .VelocidadAlta
        }
    }
}

class Auto{
    
    var velocidad = Velocidades(velocidadInicial: apagado)
    
    init(velocidad: Velocidades){
        self.velocidad = velocidad
    }
    
    func cambioDeVelocidad(anterior : Int) -> ( actual : Int, velocidadEnCadena: String){
        
        var mensaje : String
      
        switch anterior{
        case apagado:
            velocidad = .VelocidadBaja
            mensaje = "Velocidad Baja"
        case rangoVelocidadBaja:
            velocidad = .VelocidadMedia
            mensaje =  "Velocidad Media"
        case rangoVelocidadMedia:
            velocidad = .VelocidadAlta
            mensaje =  "Velocidad Alta"
        case rangoVelocidadAlta:
            velocidad = .Apagado
            mensaje = "Apagado"
            
        default:
            velocidad = .Apagado
            mensaje = "Apagado"
        }
        
        return (velocidad.rawValue, mensaje)
        
    }

    
}

var auto = Auto(velocidad: Velocidades.VelocidadAlta)

var estadoAuto = auto.cambioDeVelocidad(auto.velocidad.rawValue)

for i in 1...20{
    print("\(estadoAuto.0) km/h  \(estadoAuto.1)")
    estadoAuto = auto.cambioDeVelocidad(estadoAuto.0)
}



