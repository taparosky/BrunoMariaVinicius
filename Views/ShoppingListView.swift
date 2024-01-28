//
//  ShoppingListView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 26/01/24.
//

import SwiftUI

struct ShoppingListView: View {
    var body: some View {
        NavigationView{
            Group{
                ZStack {
                    content
                }
            }
            .navigationTitle("Lista de Compras")
            .toolbar{
                Button("", systemImage: "plus"){
                    
                }
            }
        }
        
    }
    
    var content: some View {
        List{
            HStack{
                Text("Imagem produto")
                
                Spacer()
                
                Text("Nome produto")
                
                Spacer()
                
                Text("Preço")
                
            }
        }
    }
}

#Preview {
    ShoppingListView()
}
