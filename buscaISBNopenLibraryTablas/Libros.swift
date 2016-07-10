//
//  Libros.swift
//  ISBNopenLibraryTablas
//
//  Created by Mario Porras on 8/7/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import Foundation
import UIKit

class Libros {
    
    //static let sharedInstance = (isbn:"", titulo:"")
    
    var isbn : String
    var titulo : String
    
/*
    private init(libros: Libros){
        self.isbn = libros.isbn
        self.titulo = libros.titulo

    }
*/
    
    init(isbn: String, titulo: String){
        self.isbn = isbn
        self.titulo = titulo
        
    }
}
