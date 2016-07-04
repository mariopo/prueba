//
//  TVC.swift
//  buscaISBNopenLibraryTablas
//
//  Created by Mario Porras on 3/7/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

struct libros {
    var isbn : String
    var titulo : String
    
    init(isbn : String, titulo : String){
        self.isbn = isbn
        self.titulo = titulo
    }
}

import UIKit

class TVC: UITableViewController {
    
    var isbns = [String]()
    var tupla = [libros]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        // let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject(_:)))
        let addButton = UIBarButtonItem(title:"Agrega",style: UIBarButtonItemStyle.Plain, target: self, action:#selector(self.nuevoISBN(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        
        self.title = "\"LIBROS\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func nuevoISBN(sender: AnyObject) {
        var titulol : String = ""
        var librol = libros(isbn: "", titulo: "")
        let alert = UIAlertController(title: "ISBN nuevo", message: "Agrega un ISBN", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Guardar", style: .Default, handler: {(action:UIAlertAction) -> Void in
            let textField = alert.textFields!.first
            self.isbns.append(textField!.text!)
            titulol = self.buscaTitulo(textField!.text!)
            librol.isbn = textField!.text!
            librol.titulo = titulol
            self.tupla.append(librol)
            self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Default) {(action:UIAlertAction) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func buscaTitulo(isbnl:String) -> String{
        var isbn_titulo : String = ""
        let etiqueta1 = "ISBN:"
        let dir: String = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
    // --> buscaTitulo
        let urls = dir + isbnl
        let url = NSURL(string: urls)
        let datos: NSData? = NSData(contentsOfURL: url!)
        
        if datos == nil{
            let alert = UIAlertController(title: "Atención", message:"Hay problemas para atender su solicitud. Revisa tu conexión a internet", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .Default) { _ in })
            self.presentViewController(alert, animated: true) { }
        } else{
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                let dico1 = json as! NSDictionary
                if dico1[etiqueta1 + isbnl] != nil {
                    let dico2 = dico1[etiqueta1 + isbnl] as! NSDictionary
                    if dico2["title"] != nil{
                        isbn_titulo = dico2["title"] as! NSString as String
                    }
                }
            }
            catch _ {
                
            }
        }
    // <-- buscaTitulo
        
        return isbn_titulo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.isbns.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = self.tupla[indexPath.row].titulo
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cc = segue.destinationViewController as! detalleVC
        
        let ip = self.tableView.indexPathForSelectedRow
        cc.isbn1 = self.tupla[ip!.row].isbn
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
