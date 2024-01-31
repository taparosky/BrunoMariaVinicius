//
//  ShoppingListView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 26/01/24.
//

import SwiftData
import SwiftUI

struct ShoppingListView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Binding var path: NavigationPath
    @Query var products: [Product]
    
    init(path: Binding<NavigationPath>) {
        _path = path
    }
    
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
                    path.append(NavigationType.form(nil))
                }
            }
        }
    }
    
    var content: some View {
        List {
            ForEach(products) { product in
                HStack{
                    Button(action: {
                        path.append(NavigationType.form(product))
                    }, label: {
                        Text("\(product.name)")
                    })
                    
                    Spacer()
                    
                    Text("Nome produto")
                    
                    Spacer()
                    
                    Text("Preço")
                    
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(products[index])
            }
        }
    }
}

#Preview {
    ShoppingListView(path: .constant(NavigationPath()))
}
