//
//  detalleVC.swift
//  buscaISBNopenLibraryTablas
//
//  Created by Mario Porras on 3/7/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit
import CoreData

class detalleVC: UIViewController {
    
    var contexto : NSManagedObjectContext? = nil
    
    var tupla = Libros(isbn: "", titulo: "")
    
    weak var delegate: DataEnteredDelegate? = nil
    
    var isbn1 : String = ""
    
    var tituloS: String = ""
    var autoresS: String = ""
    
    @IBOutlet weak var tituloL: UILabel!
    @IBOutlet weak var isbnTF: UITextField!
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
        
        tituloS = self.titulo
        
        autoresL.text = "Autor: " + self.autores
        
        autoresS = self.autores
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isbn1 != "" {
            
            isbnTF.enabled = false
            
            isbn = isbn1
            isbnTF.text = isbn1
            
            //--> Busco en la persistencia de datos
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let contexto2 = appDelegate.managedObjectContext
            
            let libroEntidad = NSEntityDescription.entityForName("Libro", inManagedObjectContext: contexto2)
            
            let peticion = libroEntidad?.managedObjectModel.fetchRequestFromTemplateWithName("obtLibro", substitutionVariables: ["isbn" : isbn])
            
            do{
                let libroEntidad2 = try contexto2.executeFetchRequest(peticion!)
                if (libroEntidad2.count > 0){
                    for libroEntidad3 in libroEntidad2 {
                        if libroEntidad3.valueForKey("isbn") != nil {
                            if libroEntidad3.valueForKey("titulo") != nil {
                                tituloL.text = libroEntidad3.valueForKey("titulo") as? String
                            }
                            if libroEntidad3.valueForKey("autores") != nil {
                                autoresL.text = libroEntidad3.valueForKey("autores") as? String
                            }
                            if libroEntidad3.valueForKey("portada") != nil {
                                portadaIV.image = UIImage(data: (libroEntidad3.valueForKey("portada") as? NSData)!)
                            }
                        }
                    }
                    
                    return
                }
            }
            catch {
                
            }
            
            // <-- Busco en la persistencia de datos
    
            sincrono()
            
            self.tupla.isbn = ""
            self.tupla.titulo = ""
            
        }else{
            isbnTF.enabled = true
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func ingresaISBN(sender: AnyObject) {
        isbn = isbnTF.text!
        sincrono()
    }
    
    @IBAction func backgroundTap(sender: UIControl)
    {
        isbnTF.resignFirstResponder()
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField)
    {
        sender.resignFirstResponder()  // Desaparecer el teclado
    }
    
    func buscaEntidad()->Bool{
        
        var encontrado : Bool = false
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let contexto2 = appDelegate.managedObjectContext
        
        let libroEntidad = NSEntityDescription.entityForName("Libro", inManagedObjectContext: contexto2)
        
        let peticion = libroEntidad?.managedObjectModel.fetchRequestFromTemplateWithName("obtLibro", substitutionVariables: ["isbn" : isbn])
        
        do{
            let libroEntidad2 = try contexto2.executeFetchRequest(peticion!)
            if (libroEntidad2.count > 0){
                encontrado = true
            }
        }
        catch {
            
        }
        return encontrado
    }
    
    override func viewWillDisappear(animated: Bool) {
     // call this method on whichever class implements our delegate protocol
        self.tupla.isbn = ""
        self.tupla.titulo = ""
        
     //--> Incluyo los datos en la B.D.
     //   let nuevoLibroEntidad = NSEntityDescription.insertNewObjectForEntityForName("Libro", inManagedObjectContext: self.contexto2!)
        //print("isbn1: \(isbn1) / isbnTF.text: \(isbnTF.text) / tituloS: \(tituloS)")
        if (isbn1 == "")&&(isbnTF.text != "")&&(tituloS != "")&&(buscaEntidad() == false) {
            
            self.tupla.isbn = self.isbn
            self.tupla.titulo = self.titulo
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let contexto2 = appDelegate.managedObjectContext
            let entidad = NSEntityDescription.entityForName("Libro", inManagedObjectContext: contexto2)
            let nuevoLibroEntidad = NSManagedObject(entity: entidad!, insertIntoManagedObjectContext: contexto2)
            nuevoLibroEntidad.setValue(isbnTF.text!, forKey: "isbn")
            nuevoLibroEntidad.setValue(tituloS, forKey: "titulo")
            if autoresL.text != "" {
                nuevoLibroEntidad.setValue(autoresS, forKey: "autores")
            }
            if portadaIV.image != nil{
                nuevoLibroEntidad.setValue(UIImagePNGRepresentation(portadaIV.image!), forKey: "portada")
            }
            do{
                try contexto2.save()
            }
            catch{
            
            }
        }
        
        delegate?.userDidEnterInformation(tupla)
        
     //<-- Incluyo los datos en la B.D.
        
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
