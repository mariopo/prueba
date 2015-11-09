//: Playground - noun: reto1Modulo2

import UIKit

/*
Se debe imprimir una serie del 0...100
con las siguientes reglas:
Divisible entre 5: Imprimir el # y la palabra Bingo!!!
Si es par: #par
Si es impar: #impar
30…40: #Viva Swift!!!
*/

let rango = 0...100

for var numero in rango{
    
    if numero % 5 == 0 {
        print("\(numero) Bingo!!!")
    }
    
    if numero % 2 == 0 {
        print("\(numero) par")
    }else {
        print("\(numero) impar")
    }
    
    if numero >= 30 && numero <= 40{
        print("\(numero) Viva Swift!!!")
    }
}
