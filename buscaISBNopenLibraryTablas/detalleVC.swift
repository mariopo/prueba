//
//  detalleVC.swift
//  buscaISBNopenLibraryTablas
//
//  Created by Mario Porras on 3/7/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit

class detalleVC: UIViewController {
    
    var isbn1 : String = ""
    
    @IBOutlet weak var tituloL: UILabel!
    @IBOutlet weak var isbnL: UILabel!
    @IBOutlet weak var autoresL: UILabel!
    @IBOutlet weak var portadaIV: UIImageView!

    
    let dir: String = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
    var isbn: String = ""
    var respuesta: String = ""
    var err_respuesta: String = ""
    var err: String = ""
    var titulo : String = ""
    var autores_array : NSArray = []
    var autores : String = ""
    var portada : String = ""
    
    func sincrono() {
        // existen 3 posibles tamaños de imagen: small, medium, large
        let tamano = "large"
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
                if dico1[etiqueta1 + isbn] != nil {
                    let dico2 = dico1[etiqueta1 + isbn] as! NSDictionary
                    if dico2["title"] != nil{
                        self.titulo = dico2["title"] as! NSString as String
                    }
                    if dico2["by_statement"] != nil{
                        self.autores = dico2["by_statement"] as! NSString as String
                    }else{
                        if dico2["authors"] != nil{
                            let dico4 = dico2["authors"] as! NSArray
                            for i in 0...dico4.count - 1{
                                autores += dico4[i]["name"] as! String + "; "
                            }
                        } else {
                        autores = "¡No hay datos!"
                        }
                    }
                    if dico2["cover"] != nil{
                        let dico5 = dico2["cover"] as! NSDictionary
                        if dico5[tamano] != nil{
                            self.portada = dico5[tamano] as! NSString as String
                            let img_url = NSURL(string: self.portada)
                            if let img_datos = NSData(contentsOfURL: img_url!){
                                if let imagen = UIImage(data: img_datos){
                                    portadaIV.image = imagen
                                }
                            }
                        }
                    }
                }
            }
            catch _ {
                
            }
        }
        tituloL.text = "Título: " + self.titulo
        
        autoresL.text = "Autor: " + self.autores
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isbn = isbn1
        self.isbnL.text = isbn1
        
        sincrono()

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
