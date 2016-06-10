//
//  adicionalVC.swift
//  pizzaMovil
//
//  Created by Mario Porras on 27/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class adicionalVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
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
    
    let adicional = ["Jamón","Pepperoni","Pavo","Salchicha","Aceituna","Cebolla","Pimiento","Piña","Anchoa"]
    let leyenda1 = "Tu Pizza: "
    
    var adicionalArr: [String] = ["Sin Adicionales"]
    var adicionalesvli : Int =  0
    var adicionalls: String = "Sin Adicionales"
    var primeraVez: Bool = true

    @IBOutlet weak var pizzaL: UILabel!
    @IBOutlet weak var adicionalPV: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adicionalPV.dataSource = self
        adicionalPV.delegate = self
        
        pizzaL.text = leyenda1 + pizzaad.tam + ", " + pizzaad.masa + ", " + pizzaad.queso

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView)->Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int{
        return adicional.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return adicional[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        adicionalls = self.pickerView(adicionalPV, titleForRow: row, forComponent: component)!
    }

    @IBAction func eliminaAB(sender: UIButton) {
        
        var existe: Bool = false
        var registro_top: Int = 0
        var registros: Int = 0
        var indice: Int = 0
        var adls: String = ""
        
        registro_top = adicionalArr.count - 1
        for i in 0...registro_top{
            if adicionalls == adicionalArr[i]{
                existe = true
                indice = i
            }
        }
        if existe{
            adicionalArr.removeAtIndex(indice)
            registro_top = adicionalArr.count - 1
        }
        
        registros = adicionalArr.count - 1
        
        for i in 0...registros {
            adls += ", " + adicionalArr[i]
        }
        
        pizzaL.text = leyenda1 + pizzaad.tam + ", " + pizzaad.masa + ", " + pizzaad.queso + adls
        
    }
    
    @IBAction func seleccionaAB(sender: UIButton) {
        
        var noExiste: Bool = true
        var registro_top: Int = 0
        var registros: Int = 0
        var adls: String = ""
        
        registro_top = adicionalArr.count - 1
        for i in 0...registro_top{
            if adicionalls == adicionalArr[i]{
                noExiste = false
            }
        }
        if noExiste && registro_top < 4 {
            if !primeraVez {
               adicionalArr.append(adicionalls)
            }else{
               adicionalArr[registro_top]=adicionalls
               primeraVez = false
            }
            registro_top += 1
        }
        
        registros = adicionalArr.count - 1
        
        for i in 0...registros {
            adls += ", " + adicionalArr[i]
        }
        
        pizzaL.text = leyenda1 + pizzaad.tam + ", " + pizzaad.masa + ", " + pizzaad.queso + adls
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // En esta función calculo el dato y lo preparo para que
        // sea enviado a la siguiente vista
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
        
        var pizza = PizzaC(tam:"N/A", masa:"N/A", queso:"N/A", adicionales:[""])
        
        pizza.tam = pizzaad.tam
        pizza.masa = pizzaad.masa
        pizza.queso = pizzaad.queso
        pizza.adicionales = adicionalArr
        
        let sigVista = segue.destinationViewController as! pizzaVC
        sigVista.pizzaco.tam = pizza.tam
        sigVista.pizzaco.masa = pizza.masa
        sigVista.pizzaco.queso = pizza.queso
        sigVista.pizzaco.adicionales = pizza.adicionales
        
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
