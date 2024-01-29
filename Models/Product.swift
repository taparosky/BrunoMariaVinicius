//
//  Product.swift
//  ComprasUSA
//
//  Created by Bruno on 29/01/24.
//

import Foundation
import SwiftData

@Model
final class Product {
    var name: String
    var price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}
