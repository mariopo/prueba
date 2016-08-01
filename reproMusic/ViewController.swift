//
//  ViewController.swift
//  reproMusic
//
//  Created by Mario Porras on 29/7/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private var reproductor: AVAudioPlayer!
    var primeraVez :Bool = true
    
    let cancionesArr = ["vlc-Earth, Wind September","vlc-Feel so Good - Chuck Mangion","vlc-Jarabe De Palo - La Flaca","vlc-Miguel Ríos-Todo a pulmón","vlc-Santana - Corazon Espinado - Mana"]
    let titulosArr = ["September - Earth, Wind & Fire","Feel so Good - Chuck Mangione","La Flaca - Jarabe De Palo","Todo a pulmón - Miguel Ríos","Corazón Espinado - Santana - Maná"]
    let portadasArr = ["i-am","Feel so Good - Chuck Mangione","Jarabe de Palo - La Flaca 170x170","Miguel Ríos - La Encrucijada 170x170","Supernatural - Santanta170x170"]
    
    let extensionPortada = ["png","jpg","jpeg","jpeg","jpeg"]

    @IBOutlet weak var cancionesPV: UIPickerView!
    @IBOutlet weak var portadaIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cancionesPV.dataSource = self
        cancionesPV.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        if primeraVez{
            primeraVez = false
            cargaCancion(0)
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView)->Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int{
        return cancionesArr.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return titulosArr[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        /*
        tam = self.pickerView(myPicker, titleForRow: row, forComponent: component)!
        pizzaL.text = leyenda1 + self.pickerView(myPicker, titleForRow: row, forComponent: component)!
        */
        detener()
        cargaCancion(cancionesPV.selectedRowInComponent(0))
        tocar()
    }
    
    func cargaCancion(row: Int) {
        let sonidoURL = NSBundle.mainBundle().URLForResource(cancionesArr[row], withExtension: "mp3")
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
        }catch{
            print("Error al cargar el archivo de sonido")
        }
        
        portadaIV.image = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource(portadasArr[row],ofType:extensionPortada[row])!)
        
    }
    

    @IBAction func tocar() {
        if !reproductor.playing{
            reproductor.play()
        }
    }
    
    @IBAction func pausar() {
        if reproductor.playing{
            reproductor.pause()
        }
    }
    
    @IBAction func detener() {
        if reproductor.playing{
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    
    func randRange (lower: Int, upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    @IBAction func aleatorio() {
        detener()
        let row = randRange(0, upper: (cancionesArr.count - 1))
        cancionesPV.selectRow(row, inComponent: 0, animated: true)
        cargaCancion(row)
        tocar()
    }
    @IBAction func sliderValueChanged(sender: UISlider) {
        reproductor.volume = sender.value
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

