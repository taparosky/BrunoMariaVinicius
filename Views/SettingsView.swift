//
//  SettingsView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 27/01/24.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("dolarExchange", store: .standard) var dolarExchange: Double = 4.9
    @AppStorage("iof", store: .standard) var iof: Double = 5.38
    
    var body: some View {
        NavigationView {
            Form {
                Section("Cotação do dólar (R$)") {
                    TextField(
                        " ",
                        value: $dolarExchange,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                
                }
                
                Section("IOF (%)") {
                    TextField(
                        " ",
                        value: $iof,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Ajustes")
        }
    }
}

#Preview {
    SettingsView()
}
