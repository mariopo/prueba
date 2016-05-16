//
//  PizzaAd.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 15/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import WatchKit

class PizzaAd: NSObject {
    var tam: String = ""
    var masa: String = ""
    var queso: String = ""
    
    init(t:String, m:String, q:String){
        tam = t
        masa = m
        queso = q
    }

}
