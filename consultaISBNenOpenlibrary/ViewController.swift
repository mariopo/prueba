//
//  ViewController.swift
//  peticionServidorOpenlibrary
//
//  Created by Mario Porras on 17/6/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var isbnTF: UITextField!
    @IBOutlet weak var errorL: UILabel!
    @IBOutlet weak var tituloL: UILabel!
    @IBOutlet weak var autoresL: UILabel!
    
    
    let dir: String = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
    var isbn: String = ""
    var respuesta: String = ""
    var err_respuesta: String = ""
    var err: String = ""
    var titulo : String = ""
    var autores_array : NSArray = []
    var autores : String = ""
    
    func sincrono() {
        let etiqueta1 = "ISBN:"
        let urls = dir + isbn
        let url = NSURL(string: urls)
        let datos: NSData? = NSData(contentsOfURL: url!)
        
         if datos == nil{
            let alert = UIAlertController(title: "Atención", message:"Hay problemas para atender su solicitud. Revisa tu conexión a internet", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .Default) { _ in })
            self.presentViewController(alert, animated: true) { }
            self.respuesta = "¡No hay datos!"
            } else{
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                    let dico1 = json as! NSDictionary
                    let dico2 = dico1[etiqueta1 + isbn] as! NSDictionary
                    self.titulo = dico2["title"] as! NSString as String
                    if dico2["authors"] != nil{
                        let dico4 = dico2["authors"] as! NSArray
                        for i in 0...dico4.count - 1{
                            autores += dico4[i]["name"] as! String + "; "
                        }
                    } else {
                        autores = "¡No hay datos!"
                    }
                }
                catch _ {
                        
                }
            }
        tituloL.text = "Título: " + self.titulo

        autoresL.text = "Autores: " + autores
    }
 /*
    func asincrono() {
        let urls = dir + isbn
        let url = NSURL(string: urls)
        let sesión = NSURLSession.sharedSession()
        let bloque = { (datos: NSData?, reps : NSURLResponse?, error : NSError?) -> Void in
            /*
            if datos == nil{
                let alert = UIAlertController(title: "Atención", message:"Hay problemas para atender su solicitud. Revisa tu conexión a internet", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: .Default) { _ in })
                self.presentViewController(alert, animated: true) { }
                /*
                self.err_respuesta = String(error?.code) + (error?.localizedFailureReason)!
                */
            } else{
             
                let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
                self.respuesta = texto! as String
                
                self.err_respuesta = reps.debugDescription
                self.err = String(error?.code)
 
            } */
            
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            self.respuesta = texto! as String
            self.err_respuesta = reps.debugDescription
            self.err = String(error?.code)
            
        }
        
        let dt = sesión.dataTaskWithURL(url!,completionHandler:bloque)
         dt.resume()
        
        if self.respuesta == " " {
            self.respuesta = "¡No hay datos!"
        }
        if (self.err_respuesta != "")||(self.err != ""){
        errorL.text = " Response: " + self.err_respuesta + " / Error: " + self.err
        }
        respuestaL.text = self.respuesta
    }
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isbnTF.delegate = self
        
        isbn = isbnTF.text!
        
        errorL.text = " "
        
        sincrono()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func inicializaA(sender: AnyObject) {
        autores = ""
        errorL.text = " "
        tituloL.text = " "
        autoresL.text = " "
    }
    
    @IBAction func isbnNuevoA(sender: UITextField) {
        
        respuesta = "SIN DATOS"
        errorL.text = " "
        isbn = isbnTF.text!
        
        sincrono()
    }
 /*
    
    @IBAction func textFieldDidBeginEditing(textField: UITextField) {
        var punto : CGPoint
        punto = CGPointMake(0, textField.frame.origin.y - 50)
        self.scroll.setContentOffset(punto, animated: true)
    }
    
    @IBAction func textFieldDidEndEditing(textField: UITextField) {
        self.scroll.setContentOffset(CGPointZero, animated: true)
    }
    */
    @IBAction func backgroundTap(sender: UIControl)
    {
        isbnTF.resignFirstResponder()
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField)
    {
        sender.resignFirstResponder()  // Desaparecer el teclado
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

