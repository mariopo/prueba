//
//  masaVC.swift
//  pizzaMovil
//
//  Created by Mario Porras on 24/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class masaVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var tamano: String = "Sin tamaño"
    var masaElegida: String = "Sin elección"
    
    let masa = ["Delgada","Crujiente","Gruesa"]
    let leyenda1 = "Tu Pizza: "
    @IBOutlet weak var masaPV: UIPickerView!
    @IBOutlet weak var pizzaL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        masaPV.dataSource = self
        masaPV.delegate = self
        
        pizzaL.text = leyenda1 + tamano +
        ", Delgada"

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView)->Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int{
        return masa.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return masa[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        masaElegida = self.pickerView(masaPV, titleForRow: row, forComponent: component)!
        pizzaL.text = leyenda1 + tamano + ", " + self.pickerView(masaPV, titleForRow: row, forComponent: component)!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // En esta función calculo el dato y lo preparo para que
        // sea enviado a la siguiente vista
        struct PizzaQ{
            var tam : String
            var masa : String
            init(tam : String, masa : String){
                self.tam = tam
                self.masa = masa
            }
        }
        
        var pizza = PizzaQ(tam:"N/A", masa:"N/A")
        
        pizza.tam = tamano
        pizza.masa = masaElegida
        
        let sigVista = segue.destinationViewController as! quesoVC
        sigVista.pizzaque.tam = pizza.tam
        sigVista.pizzaque.masa = pizza.masa
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
