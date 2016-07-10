//
//  DataEnteredDelegate.swift
//  ISBNopenLibraryTablas
//
//  Created by Mario Porras on 9/7/16.
//  Copyright © 2016 MAPC. All rights reserved.
//

import Foundation

// protocol used for sending data back
protocol DataEnteredDelegate: class {
    func userDidEnterInformation(info: Libros)
}