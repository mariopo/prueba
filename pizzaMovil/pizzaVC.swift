//
//  pizzaVC.swift
//  pizzaMovil
//
//  Created by Mario Porras on 27/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class pizzaVC: UIViewController {
    
    struct PizzaC{
        var tam : String
        var masa : String
        var queso : String
        var adicionales : [String]
        init(tam : String, masa : String, queso : String, adicionales: [String]){
            self.tam = tam
            self.masa = masa
            self.queso = queso
            self.adicionales = []
        }
    }
    
    var pizzaco = PizzaC(tam:"N/A", masa:"N/A", queso:"N/A", adicionales:[""])
    
    var pizzaToda: String = ""
    var adicionaS: String = ""
    var adil: Int = 0
    @IBOutlet weak var pizzaL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        adil = pizzaco.adicionales.count - 1
        pizzaToda = "Tamaño: " + pizzaco.tam + ". Masa: " + pizzaco.masa + ". Queso: " + pizzaco.queso + ". Adicionales: "
        
        for i in 0...adil{
            if i > 0 {
                adicionaS += ", " + pizzaco.adicionales[i]
            }else{
                adicionaS += pizzaco.adicionales[i]
            }
        }
        
        pizzaToda += adicionaS + "."
        
        pizzaL.text = pizzaToda

        // Do any additional setup after loading the view.
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
