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
    @State private var showingAlert: Bool = false
    @State private var alertMsg = ""
    @State var productName: String = ""
    @State var tax: Double = 0.0
    @State var price: Double = 0.0
    @State var card: Bool = false
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    @State private var image: Image?
    
    
    var product: Product?
    
    var body: some View {
        NavigationView{
            Group{
                VStack{
                    form
                    saveButton
                }
                .alert("\(alertMsg)", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
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
                    .keyboardType(.numberPad)
            }
            
            Section("Valor do produto (U$)") {
                TextField("0", value: $price, format: .number)
                    .keyboardType(.decimalPad)
            }
            
            Section("Meio de pagamento") {
                Toggle(isOn: $card){
                    Text("Pagou com cartão?")
                }
            }
            
            Section("Foto") {
                PhotosPicker(selection: $selectedPhoto, matching: .images) {
                    Label("Escolher foto", systemImage: "giftcard.fill")
                }
                
                image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            .onChange(of: selectedPhoto) {
                Task {
                    if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                        selectedPhotoData = data
                        
                        if let img = UIImage(data: data) {
                            image = Image(uiImage: img)
                        }
                    }
                }
            }
        }
        .onAppear {
            if let product {
                productName = product.name
                tax = product.tax
                price = product.price
                card = product.isPaidWithCreditCard
                selectedPhotoData = product.photo
                
                if let img = UIImage(data: product.photo) {
                    image = Image(uiImage: img)
                }
            }
        }
    }
    
    var saveButton: some View {
        Button{
            if let product {
                if productName.isEmpty {
                    alertMsg = "Informe o nome do produto"
                    showingAlert.toggle()
                } else if tax <= 0 {
                    alertMsg = "Informe o imposto do Estado"
                    showingAlert.toggle()
                } else if price <= 0 {
                    alertMsg = "Informe o preço do produto"
                    showingAlert.toggle()
                } else if selectedPhotoData == nil {
                    alertMsg = "Selecione uma foto do produto"
                    showingAlert.toggle()
                } else {
                    if let photoData = selectedPhotoData {
                        product.name = productName
                        product.tax = tax
                        product.price = price
                        product.isPaidWithCreditCard = card
                        product.photo = photoData
                    }
                    
                    path.removeLast()
                }
            } else {
                if productName.isEmpty {
                    alertMsg = "Informe o nome do produto"
                    showingAlert.toggle()
                } else if tax <= 0 {
                    alertMsg = "Informe o imposto do Estado"
                    showingAlert.toggle()
                } else if price <= 0 {
                    alertMsg = "Informe o preço do produto"
                    showingAlert.toggle()
                } else if selectedPhotoData == nil {
                    alertMsg = "Selecione uma foto do produto"
                    showingAlert.toggle()
                } else {
                    if let photoData = selectedPhotoData {
                        modelContext.insert(Product(
                            name: productName,
                            tax: tax,
                            price: price,
                            isPaidWithCreditCard: card,
                            photo: photoData
                        ))
                    }
                    
                    path.removeLast()
                }
            }
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
