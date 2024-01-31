//
//  MainView.swift
//  ComprasUSA
//
//  Created by Vinícius Taparosky on 26/01/24.
//

import SwiftUI

struct MainView: View {

    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            TabView{
                ShoppingListView(path: $path)
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
            .navigationDestination(for: NavigationType.self) { type in
                switch type {
                case .form:
                    ShoppingFormView(path: $path)
                }
            }
        }
        
//        TabView{
//            ShoppingListView()
//                .tabItem {
//                    Label("Compras", systemImage: "cart.circle.fill")
//                }
//            SettingsView()
//                .tabItem {
//                    Label("Ajustes", systemImage: "gear.circle.fill")
//                }
//            SubtotalView()
//                .tabItem {
//                    Label("Total da compra", systemImage: "dollarsign.circle.fill" )}
//        }
    }
}


#Preview {
    MainView()
}
