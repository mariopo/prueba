//
//  tamanoVC.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 2/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class tamanoVC: UIViewController {

    @IBOutlet weak var tamanoUIL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chicaBA() {
        tamanoUIL.text = "Chica"
    }

    @IBAction func medianaBA() {
        tamanoUIL.text = "Mediana"
    }
    
    @IBAction func grandeBA() {
        tamanoUIL.text = "Grande"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // En esta función calculo el dato y lo preparo para que
        // sea enviado a la siguiente vista
        let tamano_pizza = tamanoUIL.text
        let sigVista = segue.destinationViewController as! masaVC
        sigVista.tamano = tamano_pizza!
        
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
