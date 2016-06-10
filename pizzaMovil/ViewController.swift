//
//  ViewController.swift
//  pizzaMovil
//
//  Created by Mario Porras on 23/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let tamano = ["Chica","Mediana","Grande"]
    let leyenda1 = "Tu Pizza: "
    var tam: String = ""
    @IBOutlet weak var pizzaL: UILabel!
    @IBOutlet weak var myPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.dataSource = self
        myPicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView)->Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int{
        return tamano.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return tamano[row]
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        tam = self.pickerView(myPicker, titleForRow: row, forComponent: component)!
        pizzaL.text = leyenda1 + self.pickerView(myPicker, titleForRow: row, forComponent: component)!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // En esta función calculo el dato y lo preparo para que
        // sea enviado a la siguiente vista
        let sigVista = segue.destinationViewController as! masaVC
        sigVista.tamano = tam
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

