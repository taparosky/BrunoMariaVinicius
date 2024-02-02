//
//  SubtotalView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 27/01/24.
//

import SwiftData
import SwiftUI

struct SubtotalView: View {
    
    @Query var products: [Product]
    @AppStorage("dolarExchange", store: .standard) var dolarExchange: Double = 4.9
    @AppStorage("iof", store: .standard) var iof: Double = 5.38
        
    var body: some View {
        NavigationView{
            Group{
                VStack{
                    
                    Text("Valor dos produtos ($)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("$ \(totalPrices(), specifier: "%.2f")")
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text("Total com impostos($)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("$ \(totalPricesWithTaxes(), specifier: "%.2f")")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text("Valor final em reais")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(numberFormatter.string(from: NSNumber(value: totalPricesReal())) ?? "R$ \(totalPricesReal())")
                        .font(.largeTitle)
                        .foregroundStyle(.green)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                }
                .padding()
            }
            .navigationTitle("Resumo da compra")
        }
    }
    
    fileprivate func totalPrices() -> Double {
        var totalPrices: Double = 0.0
        
        for product in products {
            totalPrices += product.price
        }
        
        return totalPrices
    }
    
    fileprivate func totalPricesWithTaxes() -> Double {
       
        var totalPricesWithTaxes: Double = 0.0
        
        for product in products {
            var productPrice: Double = 0.0
            
            productPrice = product.price + (product.price * product.tax/100)
            
            if(product.isPaidWithCreditCard){
                productPrice += productPrice * iof/100
            }
            
            totalPricesWithTaxes += productPrice
        }
        
        return totalPricesWithTaxes
       
    }
    
    fileprivate func totalPricesReal() -> Double {
        var totalPricesReal: Double = totalPricesWithTaxes() * dolarExchange
        return totalPricesReal
    }
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt-BR")
        return formatter}()

    

}

#Preview {
    SubtotalView()
}
