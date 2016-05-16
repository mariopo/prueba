//
//  adicionalesVC.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 6/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class adicionalesVC: UIViewController {
    
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
    
    var pizzaad = PizzaA(tam:"N/A", masa:"N/A", queso:"N/A")
    
    var adicionalesvli : Int =  0

    @IBOutlet weak var jamonUIL: UILabel!
    @IBOutlet weak var pepperoniUIL: UILabel!
    @IBOutlet weak var pavoUIL: UILabel!
    @IBOutlet weak var salchichaUIL: UILabel!
    @IBOutlet weak var aceitunaUIL: UILabel!
    @IBOutlet weak var cebollaUIL: UILabel!
    @IBOutlet weak var pimientoUIL: UILabel!
    @IBOutlet weak var pinaUIL: UILabel!
    @IBOutlet weak var anchoaUIL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        jamonUIL.text = ""
        pepperoniUIL.text = ""
        pavoUIL.text = ""
        salchichaUIL.text = ""
        aceitunaUIL.text = ""
        cebollaUIL.text = ""
        pimientoUIL.text = ""
        pinaUIL.text = ""
        anchoaUIL.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func jamonBA() {
        if jamonUIL.text == ""{
            if adicionalesvli < 5{
                jamonUIL.text = "X"
                adicionalesvli += 1
            }
        }else{
            if adicionalesvli > 0{
                jamonUIL.text = ""
                adicionalesvli -= 1
            }
        }
    }
    

    @IBAction func pepperoniBA() {
        if pepperoniUIL.text == ""{
            if adicionalesvli < 5{
                pepperoniUIL.text = "X"
                adicionalesvli += 1
            }
        }else{
            if adicionalesvli > 0{
                pepperoniUIL.text = ""
                adicionalesvli -= 1
            }
        }
    }
    
    @IBAction func pavoBA() {
        if pavoUIL.text == ""{
            if adicionalesvli < 5{
                pavoUIL.text = "X"
                adicionalesvli += 1
            }
        }else{
            if adicionalesvli > 0{
                pavoUIL.text = ""
                adicionalesvli -= 1
            }
        }
    }

    @IBAction func salchichaBA() {
        if salchichaUIL.text == ""{
            if adicionalesvli < 5{
                salchichaUIL.text = "X"
                adicionalesvli += 1
            }
        }else{
            if adicionalesvli > 0{
                salchichaUIL.text = ""
                adicionalesvli -= 1
            }
        }
    }
    
    @IBAction func aceitunaBA(sender: UIButton, forEvent event: UIEvent) {
        if aceitunaUIL.text == ""{
            if adicionalesvli < 5{
                aceitunaUIL.text = "X"
                adicionalesvli += 1
            }
        }else{
            if adicionalesvli > 0{
                aceitunaUIL.text = ""
                adicionalesvli -= 1
            }
        }
    }
    
    @IBAction func cebollaBA() {
        if cebollaUIL.text == ""{
            if adicionalesvli < 5{
                cebollaUIL.text = "X"
                adicionalesvli += 1
            }
        }else{
            if adicionalesvli > 0{
                cebollaUIL.text = ""
                adicionalesvli -= 1
            }
        }
    }
   
    @IBAction func pimientoBA() {
        if pimientoUIL.text == ""{
            if adicionalesvli < 5{
                pimientoUIL.text = "X"
                adicionalesvli += 1
            }
        }else{
            if adicionalesvli > 0{
                pimientoUIL.text = ""
                adicionalesvli -= 1
            }
        }
    }
    
    @IBAction func pinaBA() {
        if pinaUIL.text == ""{
            if adicionalesvli < 5{
                pinaUIL.text = "X"
                adicionalesvli += 1
            }
        }else{
            if adicionalesvli > 0{
                pinaUIL.text = ""
                adicionalesvli -= 1
            }
        }
    }
    
    @IBAction func anchoaBA() {
        if anchoaUIL.text == ""{
            if adicionalesvli < 5{
                anchoaUIL.text = "X"
                adicionalesvli += 1
            }
        }else{
            if adicionalesvli > 0{
                anchoaUIL.text = ""
                adicionalesvli -= 1
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // En esta función calculo el dato y lo preparo para que
        // sea enviado a la siguiente vista
        struct PizzaC{
            var tam : String
            var masa : String
            var queso : String
            var ing1: String
            var ing2: String
            var ing3: String
            var ing4: String
            var ing5: String
            init(tam : String, masa : String, queso : String, ing1 : String, ing2 : String, ing3 : String, ing4 : String, ing5 : String){
                self.tam = tam
                self.masa = masa
                self.queso = queso
                self.ing1 = ing1
                self.ing2 = ing2
                self.ing3 = ing3
                self.ing4 = ing4
                self.ing5 = ing5
            }
        }
        
        var pizza = PizzaC(tam:"N/A", masa:"N/A", queso:"N/A", ing1:"N/A", ing2:"N/A", ing3:"N/A", ing4:"N/A", ing5:"N/A")
        
        pizza.tam = pizzaad.tam
        pizza.masa = pizzaad.masa
        pizza.queso = pizzaad.queso
        
        var ingredientes : Int = 1
        var error : Bool = true

        for i in 1...9{
            switch i {
            case 1:
                if jamonUIL.text == "X"{
                    switch ingredientes {
                    case 1:
                        pizza.ing1 = "Jamón"
                    case 2:
                        pizza.ing2 = "Jamón"
                    case 3:
                        pizza.ing3 = "Jamón"
                    case 4:
                        pizza.ing4 = "Jamón"
                    case 5:
                        pizza.ing5 = "Jamón"
                    default:
                        error = true
                    }
                    ingredientes += 1
                }
            case 2:
                if pepperoniUIL.text == "X"{
                    switch ingredientes {
                    case 1:
                        pizza.ing1 = "Pepperoni"
                    case 2:
                        pizza.ing2 = "Pepperoni"
                    case 3:
                        pizza.ing3 = "Pepperoni"
                    case 4:
                        pizza.ing4 = "Pepperoni"
                    case 5:
                        pizza.ing5 = "Pepperoni"
                    default:
                        error = true
                    }
                    ingredientes += 1
                }
            case 3:
                if pavoUIL.text == "X"{
                    switch ingredientes {
                    case 1:
                        pizza.ing1 = "Pavo"
                    case 2:
                        pizza.ing2 = "Pavo"
                    case 3:
                        pizza.ing3 = "Pavo"
                    case 4:
                        pizza.ing4 = "Pavo"
                    case 5:
                        pizza.ing5 = "Pavo"
                    default:
                        error = true
                    }
                    ingredientes += 1
                }
            case 4:
                if aceitunaUIL.text == "X"{
                    switch ingredientes {
                    case 1:
                        pizza.ing1 = "Aceituna"
                    case 2:
                        pizza.ing2 = "Aceituna"
                    case 3:
                        pizza.ing3 = "Aceituna"
                    case 4:
                        pizza.ing4 = "Aceituna"
                    case 5:
                        pizza.ing5 = "Aceituna"
                    default:
                        error = true
                    }
                    ingredientes += 1
                }
            case 5:
                if salchichaUIL.text == "X"{
                    switch ingredientes {
                    case 1:
                        pizza.ing1 = "Salchicha"
                    case 2:
                        pizza.ing2 = "Salchicha"
                    case 3:
                        pizza.ing3 = "Salchicha"
                    case 4:
                        pizza.ing4 = "Salchicha"
                    case 5:
                        pizza.ing5 = "Salchicha"
                    default:
                        error = true
                    }
                    ingredientes += 1
                }
            case 6:
                if cebollaUIL.text == "X"{
                    switch ingredientes {
                    case 1:
                        pizza.ing1 = "Cebolla"
                    case 2:
                        pizza.ing2 = "Cebolla"
                    case 3:
                        pizza.ing3 = "Cebolla"
                    case 4:
                        pizza.ing4 = "Cebolla"
                    case 5:
                        pizza.ing5 = "Cebolla"
                    default:
                        error = true
                    }
                    ingredientes += 1
                }
            case 7:
                if pimientoUIL.text == "X"{
                    switch ingredientes {
                    case 1:
                        pizza.ing1 = "Pimiento"
                    case 2:
                        pizza.ing2 = "Pimiento"
                    case 3:
                        pizza.ing3 = "Pimiento"
                    case 4:
                        pizza.ing4 = "Pimiento"
                    case 5:
                        pizza.ing5 = "Pimiento"
                    default:
                        error = true
                    }
                    ingredientes += 1
                }
            case 8:
                if pinaUIL.text == "X"{
                    switch ingredientes {
                    case 1:
                        pizza.ing1 = "Piña"
                    case 2:
                        pizza.ing2 = "Piña"
                    case 3:
                        pizza.ing3 = "Piña"
                    case 4:
                        pizza.ing4 = "Piña"
                    case 5:
                        pizza.ing5 = "Piña"
                    default:
                        error = true
                    }
                    ingredientes += 1
                }
            case 9:
                if anchoaUIL.text == "X"{
                    switch ingredientes {
                    case 1:
                        pizza.ing1 = "Anchoa"
                    case 2:
                        pizza.ing2 = "Anchoa"
                    case 3:
                        pizza.ing3 = "Anchoa"
                    case 4:
                        pizza.ing4 = "Anchoa"
                    case 5:
                        pizza.ing5 = "Anchoa"
                    default:
                        error = true
                    }
                    ingredientes += 1
                }
            default:
            error = true
            }
        }
    
        let sigVista = segue.destinationViewController as! confirmaVC
        sigVista.pizzaco.tam = pizza.tam
        sigVista.pizzaco.masa = pizza.masa
        sigVista.pizzaco.queso = pizza.queso
        sigVista.pizzaco.ing1 = pizza.ing1
        sigVista.pizzaco.ing2 = pizza.ing2
        sigVista.pizzaco.ing3 = pizza.ing3
        sigVista.pizzaco.ing4 = pizza.ing4
        sigVista.pizzaco.ing5 = pizza.ing5
        
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
