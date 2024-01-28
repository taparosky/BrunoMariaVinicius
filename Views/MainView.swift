//
//  MainView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 26/01/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        tab
    }
    
    var tab: some View {
        TabView{
            ShoppingListView()
                .tabItem {
                    Label("Compras", systemImage: "cart.circle.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Ajustes", systemImage: "gear.circle.fill")
                }
            SubtotalView()
                .tabItem {
                    Label("Total da compra", systemImage: "dollarsign.circle.fill" )}
        }
    }
    
}


#Preview {
    MainView()
}
