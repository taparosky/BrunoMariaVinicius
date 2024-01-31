//
//  ShoppingListViewModel.swift
//  ComprasUSA
//
//  Created by Bruno on 30/01/24.
//

import Foundation

final class ShoppingListViewModel {
    private(set) var products: [Product] = []
    
    init() {
        loadProducts()
    }
    
    func loadProducts() {
        let a = Product(name: "A", tax: 0, price: 0.0, isPaidWithCreditCard: false, photo: "")
        let b = Product(name: "B", tax: 0, price: 0.0, isPaidWithCreditCard: false, photo: "")
        let c = Product(name: "C", tax: 0, price: 0.0, isPaidWithCreditCard: false, photo: "")
        products = [a, b, c]
    }
}
