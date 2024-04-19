//
//  HomeView.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import SwiftUI

struct AppetizersListView: View {
    
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationView {
            List(appetizers) { appetizer in
                ApetizerListCellView(title: appetizer.name, price: appetizer.price)
            }
            .navigationTitle("Home")
        }
        .onAppear {
            getAppetizers()
        }
    }
    
    func getAppetizers () {
            NetworkManager.shared.getAppetizers { result in
                DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
      
    }
}
        
        #Preview {
            AppetizersListView()
        }
