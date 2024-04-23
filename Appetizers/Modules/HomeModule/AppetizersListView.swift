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
        ZStack {
            NavigationView {
                List(appetizersListVM.appetizers) { appetizer in
                    ApetizerListCellView(apetizer: appetizer)
                }
                .navigationTitle("Home")
            }
            .onAppear {
                appetizersListVM.getAppetizers()
            }
            if appetizersListVM.isLoading {
                LoadingView()
            } 
        }
        .alert(item: $appetizersListVM.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
    }
}

#Preview {
    AppetizersListView()
}

