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
    
    var body: some View {
        NavigationView{
            Group{
                VStack{
                    Text("Valor dos produtos ($)")
                    Text("$ \(totalPrices())")
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text("Total com impostos($)")
                    Text("$ 1,500.00")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text("Valor final em reais")
                    Text("R$ 12.000,00")
                        .font(.largeTitle)
                        .foregroundStyle(.green)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .multilineTextAlignment(.leading)
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
}

#Preview {
    SubtotalView()
}
