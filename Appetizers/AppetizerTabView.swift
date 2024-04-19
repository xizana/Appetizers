//
//  ContentView.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            AccountView()
                .tabItem {
                Image(systemName: "person")
                Text("Account")
            }
            
            OrderView()
                .tabItem {
                Image(systemName: "bag")
                Text("Order")
            }
        }
        .accentColor(Color(Colors.primaryColor))
    }
}
    
    #Preview {
        AppetizerTabView()
    }
