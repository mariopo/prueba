//
//  TVC.swift
//  buscaISBNopenLibraryTablas
//
//  Created by Mario Porras on 3/7/16.
//  Copyright © 2016 MAPC. All rights reserved.
//


import UIKit

struct Lista_Libros {
    var isbn: String
    var titulo: String
    
    init(isbn: String, titulo:String){
        self.isbn = isbn
        self.titulo = titulo
    }
}

class TVC: UITableViewController, DataEnteredDelegate {
    
    var tupla = Libros(isbn: "", titulo: "")
    var lista = [Lista_Libros]()
    
    var otroLibro = Lista_Libros(isbn: "", titulo: "")
    
    var incluir : Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        self.title = "LIBROS"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        var list = Lista_Libros(isbn: "",titulo: "")
        
        super.viewWillAppear(animated)
        
        if self.incluir {
            list.isbn = tupla.isbn
            list.titulo = tupla.titulo
            self.incluir = false
            self.lista.append(list)
        }
        self.tableView.reloadData()
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
        return self.lista.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = self.lista[indexPath.row].titulo
        
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
        
        if segue.identifier == "agrega"{
        
            self.incluir = true
            cc.isbn1 = ""
            
            let secondViewController = segue.destinationViewController as! detalleVC
            secondViewController.delegate = self
            
        }else{
        
            let ip = self.tableView.indexPathForSelectedRow
            cc.isbn1 = self.lista[ip!.row].isbn
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func userDidEnterInformation(info: Libros) {
        tupla = info
    }
        

}