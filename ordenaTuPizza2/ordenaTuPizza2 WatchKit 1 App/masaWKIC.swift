//
//  masaWKIC.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 14/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import WatchKit
import Foundation


class masaWKIC: WKInterfaceController {
    
    var tam: String = ""

    @IBOutlet var masaL: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let t=context as! Tamano
        tam = t.tam
        //print(tam)
        //masaL.setText(tam)
        
        // Configure interface objects here.
    }

    @IBAction func accionDelgada() {
        let valorContexto = PizzaQ(t: tam, m:"Delgada")
        pushControllerWithName("IdMasa", context: valorContexto)
    }
    
    @IBAction func accionCrujiente() {
        let valorContexto = PizzaQ(t: tam, m:"Crujiente")
        pushControllerWithName("IdMasa", context: valorContexto)
    }
    
    @IBAction func accionGruesa() {
        let valorContexto = PizzaQ(t: tam, m:"Gruesa")
        pushControllerWithName("IdMasa", context: valorContexto)
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
