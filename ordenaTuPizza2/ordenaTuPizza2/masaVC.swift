//
//  masaVC.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 2/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class masaVC: UIViewController {
    
    var tamano:String = "Sin tamaño"

    @IBOutlet weak var pastaUIL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        pastaUIL.text = "Crujiente"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func delgadaBA() {
        pastaUIL.text = "Delgada"
    }
    
    @IBAction func crujienteBA() {
        pastaUIL.text = "Crujiente"
    }
    
    @IBAction func gruesaBA() {
        pastaUIL.text = "Gruesa"
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
        pizza.masa = pastaUIL.text!
        
        let sigVista = segue.destinationViewController as! quesoVC
        sigVista.pizzaque.tam = pizza.tam
        sigVista.pizzaque.masa = pizza.masa
        
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
