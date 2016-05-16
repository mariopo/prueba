//
//  quesoWKIC.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 15/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import WatchKit
import Foundation


class quesoWKIC: WKInterfaceController {

    var tam: String = ""
    var masa: String = ""
    
    @IBOutlet var quesoL: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let pq=context as! PizzaQ
        tam = pq.tam
        masa = pq.masa
       // quesoL.setText(pq.tam + "/" + pq.masa)
        // Configure interface objects here.
    }

    @IBAction func accionMozzarella() {
        let valorContexto = PizzaAd(t: tam, m: masa, q:"Mozzarella")
        pushControllerWithName("IdQueso", context: valorContexto)
    }
    @IBAction func accionCheddar() {
        let valorContexto = PizzaAd(t: tam, m: masa, q:"Cheddar")
        pushControllerWithName("IdQueso", context: valorContexto)
    }
    @IBAction func accionParmesano() {
        let valorContexto = PizzaAd(t: tam, m: masa, q:"Parmesano")
        pushControllerWithName("IdQueso", context: valorContexto)
    }
    @IBAction func accionSinQueso() {
        let valorContexto = PizzaAd(t: tam, m: masa, q:"Sin Queso")
        pushControllerWithName("IdQueso", context: valorContexto)
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
