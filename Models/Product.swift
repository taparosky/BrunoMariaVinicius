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
    var tax: Double
    var price: Double
    var isPaidWithCreditCard: Bool
    var photo: String
    
    init(name: String, tax: Double, price: Double, isPaidWithCreditCard: Bool, photo: String) {
        self.name = name
        self.tax = tax
        self.price = price
        self.isPaidWithCreditCard = isPaidWithCreditCard
        self.photo = photo
    }
}
