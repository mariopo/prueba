//
//  InterfaceController.swift
//  ordenaTuPizza2 WatchKit 1 Extension
//
//  Created by Mario Porras on 14/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    @IBAction func accionChica() {
        let valorContexto = Tamano(t: "Chica")
        pushControllerWithName("IdentificadorValor", context: valorContexto)
    }
    
    @IBAction func accionMediana() {
        let valorContexto = Tamano(t: "Mediana")
        pushControllerWithName("IdentificadorValor", context: valorContexto)
    }
    
    @IBAction func accionGrande() {
        let valorContexto = Tamano(t: "Grande")
        pushControllerWithName("IdentificadorValor", context: valorContexto)
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
