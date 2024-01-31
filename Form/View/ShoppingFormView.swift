//
//  ShoppingFormView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 26/01/24.
//

import SwiftUI
import PhotosUI

struct ShoppingFormView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Binding var path: NavigationPath
    
    @State var productName: String = ""
    @State var tax: Double = 0
    @State var price: Double = 0
    @State var card: Bool = false
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var photoImageData: Data?
    
    var product: Product?
    
    var body: some View {
        NavigationView{
            Group{
                VStack{
                    form
                    saveButton
                }
            }
            .navigationTitle("Cadastro de produto")
        }
    }
    
    var form: some View{
        Form {
            Section("Nome do produto") {
                TextField("Escreva o nome do produto", text: $productName)
            }
            
            Section("Imposto do estado (%)") {
                TextField("0", value: $tax, format: .number)
            }
            
            Section("Valor do produto (U$)") {
                TextField("0", value: $price, format: .number)
            }
            
            Section("Meio de pagamento") {
                Toggle(isOn: $card){
                    Text("Pagou com cartão?")
                }
            }
            
            Section("Foto") {
                PhotosPicker(selection: $selectedPhoto, matching: .images)
                {
                    Label("Escolher foto", systemImage: "giftcard.fill")
                }
            }
        }
        .onAppear {
            if let product {
                productName = product.name
                tax = product.tax
                price = product.price
                card = product.isPaidWithCreditCard
            }
        }
    }
    
    var saveButton: some View {
        Button{
            if let product {
                product.name = productName
                product.tax = tax
                product.price = price
                product.isPaidWithCreditCard = card
            } else {
                modelContext.insert(Product(
                    name: productName,
                    tax: tax,
                    price: price,
                    isPaidWithCreditCard: card,
                    photo: ""
                ))
            }
            
            path.removeLast()
        } label: {
            Text(product == nil ? "Cadastrar" : "Atualizar")
                .padding(.vertical, 6)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .padding(16)
        
    }
    
}

#Preview {
    ShoppingFormView(path: .constant(NavigationPath()))
}
