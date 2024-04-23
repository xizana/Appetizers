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
    
    func getAppetizers () {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
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
