//
//  ApetizerResponse.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import Foundation


struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

struct Appetizer: Codable, Identifiable {
    let id: Int
    let imageURL: String
    let description: String
    let calories: Int
    let price: Double
    let carbs: Int
    let name: String
}


