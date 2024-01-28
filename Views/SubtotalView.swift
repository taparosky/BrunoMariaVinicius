//
//  SubtotalView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 27/01/24.
//

import SwiftUI

struct SubtotalView: View {
    var body: some View {
        NavigationView{
            Group{
                VStack{
                    Text("Valor dos produtos ($)")
                    Text("$ 1,200.00")
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
}

#Preview {
    SubtotalView()
}
