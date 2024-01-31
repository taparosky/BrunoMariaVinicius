//
//  ShoppingListView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 26/01/24.
//

import SwiftUI

struct ShoppingListView: View {
    
    fileprivate var viewModel: ShoppingListViewModel = ShoppingListViewModel()
    
    @Binding var path: NavigationPath
    
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
                    path.append(NavigationType.form)
                }
            }
        }
    }
    
    var content: some View {
        List {
            ForEach(viewModel.products) {_ in 
                HStack{
                    Button(action: {
                        path.append(NavigationType.form)
                    }, label: {
                        Text("Imagem produto")
                    })
                    
                    Spacer()
                    
                    Text("Nome produto")
                    
                    Spacer()
                    
                    Text("Preço")
                    
                }
            }
            .onDelete(perform: { indexSet in
                print(indexSet)
            })
        }
    }
}

#Preview {
    ShoppingListView(path: .constant(NavigationPath()))
}
