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
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en-US")
        return formatter
    }()
    
    init(path: Binding<NavigationPath>) {
        _path = path
    }
    
    var body: some View {
        NavigationView{
            Group{
                ZStack {
                    if products.isEmpty {
                        Text("Sua lista de compras está vazia")
                            .italic()
                    } else {
                        content
                    }
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
                HStack(spacing: 10) {
                    if let image = UIImage(data: product.photo) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                    
                    Spacer()
                    
                    Text("\(product.name)")

                    Text(" \(numberFormatter.string(from: NSNumber(floatLiteral: product.price)) ?? "0.0")")

                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.gray)
                }
                .onTapGesture {
                    path.append(NavigationType.form(product))
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
