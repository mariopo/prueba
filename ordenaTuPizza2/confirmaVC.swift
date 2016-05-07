//
//  confirmaVC.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 6/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class confirmaVC: UIViewController {
    
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
    
    var pizzaco = PizzaC(tam:"N/A", masa:"N/A", queso:"N/A", ing1:"N/A", ing2:"N/A", ing3:"N/A", ing4:"N/A", ing5:"N/A")

    @IBOutlet weak var tamanoUIL: UILabel!
    @IBOutlet weak var masaUIL: UILabel!
    @IBOutlet weak var quesoUIL: UILabel!
    @IBOutlet weak var ingrediente1UIL: UILabel!
    @IBOutlet weak var ingrediente2UIL: UILabel!
    @IBOutlet weak var ingrediente3UIL: UILabel!
    @IBOutlet weak var ingrediente4UIL: UILabel!
    @IBOutlet weak var ingrediente5UIL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        tamanoUIL.text = pizzaco.tam
        masaUIL.text = pizzaco.masa
        quesoUIL.text = pizzaco.queso
        ingrediente1UIL.text = pizzaco.ing1
        ingrediente2UIL.text = pizzaco.ing2
        ingrediente3UIL.text = pizzaco.ing3
        ingrediente4UIL.text = pizzaco.ing4
        ingrediente5UIL.text = pizzaco.ing5
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
