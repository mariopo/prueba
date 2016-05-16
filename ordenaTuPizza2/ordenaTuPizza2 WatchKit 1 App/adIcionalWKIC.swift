//
//  adIcionalWKIC.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 15/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import WatchKit
import Foundation


class adIcionalWKIC: WKInterfaceController {
    
    var tam: String = ""
    var masa: String = ""
    var queso: String = ""
    var cantidad: Int = 0
    var adicionales: [String] = ["Sin adicionales"]
    var top: Int = 5
    var indice: Int = 0
    @IBOutlet var jamonO: WKInterfaceSwitch!
    @IBOutlet var pepperoniO: WKInterfaceSwitch!
    @IBOutlet var pavoO: WKInterfaceSwitch!
    @IBOutlet var salchichaO: WKInterfaceSwitch!
    @IBOutlet var aceitunaO: WKInterfaceSwitch!
    @IBOutlet var cebollaO: WKInterfaceSwitch!
    @IBOutlet var pimientoO: WKInterfaceSwitch!
    @IBOutlet var pinaO: WKInterfaceSwitch!
    @IBOutlet var anchoaO: WKInterfaceSwitch!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let pa=context as! PizzaAd
        tam = pa.tam
        masa = pa.masa
        queso = pa.queso
        
        indice = adicionales.count - 1
        
        for j in indice...0{
            adicionales.removeAtIndex(j)
        }
        jamonO.setOn(false)
        pepperoniO.setOn(false)
        pavoO.setOn(false)
        salchichaO.setOn(false)
        aceitunaO.setOn(false)
        cebollaO.setOn(false)
        pimientoO.setOn(false)
        pinaO.setOn(false)
        anchoaO.setOn(false)
        
        // Configure interface objects here.
    }

    @IBAction func accJamon(value: Bool) {
        if (cantidad < top){
            seleccionaIngrediente("Jamón", activa: value)
        }else{
            jamonO.setOn(false)
            if !value{
                cantidad -= 1
            }
        }
    }
    @IBAction func accPepp(value: Bool) {
        if (cantidad < top){
            seleccionaIngrediente("Pepperoni", activa: value)
        }else{
            pepperoniO.setOn(false)
            if !value{
                cantidad -= 1
            }
        }
    }
    @IBAction func accPavo(value: Bool) {
        if (cantidad < top){
            seleccionaIngrediente("Pavo", activa: value)
        }else{
            pavoO.setOn(false)
            if !value{
                cantidad -= 1
            }
        }
    }
    @IBAction func accSalch(value: Bool) {
        if (cantidad < top){
            seleccionaIngrediente("Salchicha", activa: value)
        }else{
            salchichaO.setOn(false)
            if !value{
                cantidad -= 1
            }
        }
    }
    @IBAction func accAceituna(value: Bool) {
        if (cantidad < top){
            seleccionaIngrediente("Aceituna", activa: value)
        }else{
            aceitunaO.setOn(false)
            if !value{
                cantidad -= 1
            }
        }
    }
    @IBAction func accCebolla(value: Bool) {
        if (cantidad < top){
            seleccionaIngrediente("Cebolla", activa: value)
        }else{
            cebollaO.setOn(false)
            if !value{
                cantidad -= 1
            }
        }
    }
    @IBAction func accPimiento(value: Bool) {
        if (cantidad < top){
            seleccionaIngrediente("Pimiento", activa: value)
        }else{
            pimientoO.setOn(false)
            if !value{
                cantidad -= 1
            }
        }
    }
    @IBAction func accPina(value: Bool) {
        if (cantidad < top){
            seleccionaIngrediente("Piña", activa: value)
        }else{
            pinaO.setOn(false)
            if !value{
                cantidad -= 1
            }
        }
    }
    @IBAction func accAnchoa(value: Bool) {
        if (cantidad < top){
            seleccionaIngrediente("Anchoa", activa: value)
        }else{
            anchoaO.setOn(false)
            if !value{
                cantidad -= 1
            }
        }
    }
    
    func seleccionaIngrediente(ingrediente:String, activa: Bool){
        if activa{
          //  if cantidad < top{
                adicionales.insert(ingrediente, atIndex: cantidad)
                cantidad += 1
          //  }
        }else{
            if cantidad > 0{
                cantidad -= 1
                adicionales.removeAtIndex(cantidad)
            }else{
                adicionales.insert("Sin adicionales", atIndex: cantidad)
            }
        }
    }
    
    @IBAction func accPizzaCo() {
        let valorContexto = PizzaCo(t: tam, m: masa, q: queso, a: adicionales)
        pushControllerWithName("IdPizza", context: valorContexto)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        adicionales.removeAll()
        
        cantidad = 0
        
        jamonO.setOn(false)
        pepperoniO.setOn(false)
        pavoO.setOn(false)
        salchichaO.setOn(false)
        aceitunaO.setOn(false)
        cebollaO.setOn(false)
        pimientoO.setOn(false)
        pinaO.setOn(false)
        anchoaO.setOn(false)
        
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
