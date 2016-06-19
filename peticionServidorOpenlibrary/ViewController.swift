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
    @IBOutlet weak var respuestaL: UILabel!
    @IBOutlet weak var scroll: UIScrollView!
    
    
    let dir: String = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
    var isbn: String = ""
    var respuesta: String = ""
    
    func sincrono() {
        let urls = dir + isbn
        let url = NSURL(string: urls)
        let datos: NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding)
        respuesta = texto! as String
        respuestaL.text = respuesta
    }
    
    func asincrono() {
        let urls = dir + isbn
        let url = NSURL(string: urls)
        let sesión = NSURLSession.sharedSession()
        let bloque = { (datos: NSData?, reps : NSURLResponse?, error : NSError?) -> Void in
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            self.respuesta = texto! as String
        }
        let dt = sesión.dataTaskWithURL(url!,completionHandler: bloque)
        dt.resume()
        respuestaL.text = respuesta
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isbnTF.delegate = self
        
        isbn = isbnTF.text!
        
        sincrono()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func isbnNuevoA(sender: UITextField) {
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

