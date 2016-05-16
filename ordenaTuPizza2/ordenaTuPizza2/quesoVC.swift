//
//  quesoVC.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 3/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit


class quesoVC: UIViewController {
    
    struct PizzaQ{
        var tam : String
        var masa : String
        init(tam : String, masa : String){
            self.tam = tam
            self.masa = masa
        }
    }
    
    var pizzaque = PizzaQ(tam:"N/A", masa:"N/A")

    @IBOutlet weak var quesoUIL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        quesoUIL.text = "Mozzarella"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func mozzarellaAB() {
        quesoUIL.text = "Mozzarella"
    }
    @IBAction func cheddarAB() {
        quesoUIL.text = "Cheddar"
    }
    @IBAction func parmesanoAB() {
        quesoUIL.text = "Parmesano"
    }
    @IBAction func sinquesoAB() {
        quesoUIL.text = "Sin queso"
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
        pizza.queso = quesoUIL.text!
        
        let sigVista = segue.destinationViewController as! adicionalesVC
        sigVista.pizzaad.tam = pizza.tam
        sigVista.pizzaad.masa = pizza.masa
        sigVista.pizzaad.queso = pizza.queso
        
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
