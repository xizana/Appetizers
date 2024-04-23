//
//  HomeView.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import SwiftUI

struct AppetizersListView: View {
    
    @StateObject var appetizersListVM = AppetizersListViewModel()
    
    var body: some View {
        NavigationView {
            List(appetizersListVM.appetizers) { appetizer in
                ApetizerListCellView(title: appetizer.name, price: appetizer.price)
            }
            .navigationTitle("Home")
        }
        .onAppear {
            appetizersListVM.getAppetizers()
        }
        .alert(item: $appetizersListVM.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizersListView()
}
