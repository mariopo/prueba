//
//  quesoVC.swift
//  pizzaMovil
//
//  Created by Mario Porras on 27/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class quesoVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    struct PizzaQ{
        var tam : String
        var masa : String
        init(tam : String, masa : String){
            self.tam = tam
            self.masa = masa
        }
    }
    
    var pizzaque = PizzaQ(tam:"N/A", masa:"N/A")
    var quesols: String = ""
    
    @IBOutlet weak var pizzaL: UILabel!
    @IBOutlet weak var quesoPV: UIPickerView!
    
    let queso = ["Mozzarella","Cheddar","Parmesano","Sin Queso"]
    let leyenda1 = "Tu Pizza: "
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quesoPV.dataSource = self
        quesoPV.delegate = self
        
        pizzaL.text = leyenda1 + pizzaque.tam + ", " + pizzaque.masa +
        ", Mozzarella"

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView)->Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int{
        return queso.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return queso[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        quesols = self.pickerView(quesoPV, titleForRow: row, forComponent: component)!
        pizzaL.text = leyenda1 + pizzaque.tam + ", " + pizzaque.masa + ", " + self.pickerView(quesoPV, titleForRow: row, forComponent: component)!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // En esta función calculo el dato y lo preparo para que
        // sea enviado a la siguiente vista
        struct PizzaA{
            var tam : String
            var masa : String
            var queso : String
            init(tam : String, masa : String, queso : String){
                self.tam = tam
                self.masa = masa
                self.queso = queso
            }
        }
        
        var pizza = PizzaA(tam:"N/A", masa:"N/A", queso:"N/A")
        
        pizza.tam = pizzaque.tam
        pizza.masa = pizzaque.masa
        pizza.queso = quesols
        
        let sigVista = segue.destinationViewController as! adicionalVC
        sigVista.pizzaad.tam = pizza.tam
        sigVista.pizzaad.masa = pizza.masa
        sigVista.pizzaad.queso = pizza.queso
        
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
