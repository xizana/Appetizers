//
//  HomeView.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import SwiftUI

struct AppetizersListView: View {
    var body: some View {
        NavigationView {
            List(MockData.apetizers) { apetizer in
                ApetizerListCellView(title: apetizer.name, price: apetizer.price)
            }
                .navigationTitle("Home")
        }
    }
} 

#Preview {
    AppetizersListView()
}
