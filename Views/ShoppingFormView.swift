//
//  ShoppingFormView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 26/01/24.
//

import SwiftUI
import PhotosUI

struct ShoppingFormView: View {
    
    @Binding var path: NavigationPath
    
    @State var product: String = ""
    @State var tax: Decimal = 0
    @State var price: Decimal = 0
    @State var card: Bool = false
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var photoImageData: Data?
    
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
        Form{
            Section("Nome do produto") {
                TextField("Escreva o nome do produto", text: $product)
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
    }
    
    var saveButton: some View {
        Button{
            path.removeLast()
        } label: {
            Text("Cadastrar")
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
