//
//  PizzaCo.swift
//  ordenaTuPizza2
//
//  Created by Mario Porras on 15/5/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import WatchKit

class PizzaCo: NSObject {
    var tam: String = ""
    var masa: String = ""
    var queso: String = ""
    var adicionales: [String] = ["Sin adicionales"]

    init(t: String, m: String, q: String, a: [String]){
        tam = t
        masa = m
        queso = q
        adicionales = a
    }
}
