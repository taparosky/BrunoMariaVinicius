//
//  SettingsView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 27/01/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var dolarExchange: Decimal = 0
    @State private var iof: Decimal = 0
    
    var body: some View {
        NavigationView{
            Form{
                Section("Cotação do dólar (R$)"){
                    TextField(" ", value: $dolarExchange, format: .number)
                }
                Section("IOF (%)"){
                    TextField(" ", value: $iof, format: .number)
                }
            }
            .navigationTitle("Ajustes")
        }
    }
}

#Preview {
    SettingsView()
}
