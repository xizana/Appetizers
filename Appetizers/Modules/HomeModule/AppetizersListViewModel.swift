//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 23.04.24.
//

import SwiftUI


final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    func getAppetizers () {
        self.isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidUrl:
                        self.alertItem = AlertContext.invalidUrl
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                        
                    case .decodeError:
                        self.alertItem = AlertContext.decodeError
                    }
                }
            }
        }
    }
    
}
