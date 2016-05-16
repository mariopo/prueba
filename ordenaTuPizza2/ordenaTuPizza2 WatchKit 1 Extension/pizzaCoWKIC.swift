//
//  pizzaCoWKIC.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 15/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import WatchKit
import Foundation


class pizzaCoWKIC: WKInterfaceController {
    
    var tam: String = ""
    var masa: String = ""
    var queso: String = ""
    var cantidad: Int = 0
    var adicionales: [String] = ["Sin adicionales"]
    var top: Int = 4
    var indice: Int = 0

    @IBOutlet var tamanoL: WKInterfaceLabel!
    @IBOutlet var masaL: WKInterfaceLabel!
    @IBOutlet var quesoL: WKInterfaceLabel!
    @IBOutlet var adicionaL: WKInterfaceLabel!
    @IBOutlet var adiciona2L: WKInterfaceLabel!
    @IBOutlet var adiciona3L: WKInterfaceLabel!
    @IBOutlet var adiciona4L: WKInterfaceLabel!
    @IBOutlet var adiciona5L: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let pco=context as! PizzaCo
        
        adicionales.removeAll()
        
        tam = pco.tam
        masa = pco.masa
        queso = pco.queso
        adicionales = pco.adicionales
        
        tamanoL.setText(tam)
        masaL.setText(masa)
        quesoL.setText(queso)
        cantidad = adicionales.count
        // quesoL.setText (String(cantidad))
        if cantidad < 0 {
            cantidad = 0
        }
        
        for i in 0...top{
            switch i {
            case 0:
                if cantidad >= 1{
                    adicionaL.setText(adicionales[i])
                }else{
                    adicionaL.setText("Sin adicional")
                }
            case 1:
                if cantidad >= 2{
                    adiciona2L.setText(adicionales[i])
                }else{
                    adiciona2L.setText("Sin adicional")
                }
            case 2:
                if cantidad >= 3{
                    adiciona3L.setText(adicionales[i])
                }else{
                    adiciona3L.setText("Sin adicional")
                }
            case 3:
                if cantidad >= 4{
                    adiciona4L.setText(adicionales[i])
                }else{
                    adiciona4L.setText("Sin adicional")
                }
            case 4:
                if cantidad >= 5{
                    adiciona5L.setText(adicionales[i])
                }else{
                    adiciona5L.setText("Sin adicional")
                }
            default:
                adicionaL.setText("Error")
            }
        }
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
