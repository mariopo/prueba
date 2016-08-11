//
//  ViewController.swift
//  marcaRuta
//
//  Created by Mario Porras on 8/8/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var mapaTipoSC: UISegmentedControl!
    
    private let manejador = CLLocationManager()
    
    private var punto_base = CLLocation()
    private var no_es_inicio :Bool = false
    let rangoEntrePines :Double = 50
    private var distanciaTotal :Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manejador.delegate = self
        manejador.desiredAccuracy = kCLLocationAccuracyBest
        manejador.requestWhenInUseAuthorization()
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse{
            manejador.startUpdatingLocation()
            mapa.showsUserLocation = true
            mapa.userTrackingMode = .Follow
        }else{
            manejador.stopUpdatingLocation()
            mapa.showsUserLocation = false
        }
    }

    @IBAction func seleccionaTipoMapa(sender: AnyObject) {
        if(mapaTipoSC.selectedSegmentIndex == 0)
        {
           mapa.mapType = MKMapType.Standard
        }
        else if(mapaTipoSC.selectedSegmentIndex == 1)
        {
           mapa.mapType = MKMapType.Satellite
        }
        else if(mapaTipoSC.selectedSegmentIndex == 2)
        {
           mapa.mapType = MKMapType.Hybrid
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var crea_pin :Bool = false
        var distancial : Double = 0
        let punto_actual = manager.location!
        if no_es_inicio{
            distancial = punto_base.distanceFromLocation(punto_actual)
            if distancial > rangoEntrePines{
                crea_pin = true
                punto_base = punto_actual
            }
        }else{
            no_es_inicio = true
            punto_base = punto_actual
            crea_pin = true
        }
        if crea_pin{
            insertaPin(manager,distancia: distancial)
        }
    }
    
    func insertaPin(manager: CLLocationManager, distancia: Double){
        distanciaTotal += distancia
        var punto = CLLocationCoordinate2D()
        punto.latitude = manager.location!.coordinate.latitude
        punto.longitude = manager.location!.coordinate.longitude
        let pin = MKPointAnnotation()
        let lat = round(punto.latitude * 1000)/1000
        let lon = round(punto.longitude * 1000)/1000
        let dist = round(distanciaTotal * 100)/100
        pin.title = "Latitud: \(lat) / Longitud: \(lon)"
        pin.subtitle = "Distancia recorrida: \(dist) mts."
        pin.coordinate = punto
        mapa.addAnnotation(pin)
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        let alerta = UIAlertController(title: "ERROR", message: "error. \(error.code)", preferredStyle: .Alert)
        let accionOK = UIAlertAction(title: "Ok", style: .Default, handler: {accion in
            //..
        })
        alerta.addAction(accionOK)
        self.presentViewController(alerta, animated: true, completion: nil)
    }

}

