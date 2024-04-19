//
//  ApetizerResponse.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import Foundation


struct ApetizerResponse: Codable {
    let request: [Apetizer]
}

struct Apetizer: Codable, Identifiable {
    let id: Int
    let imageURL: String
    let description: String
    let calories: Int
    let price: Double
    let carbs: Int
    let name: String
}


struct MockData {
    
    static let apetizerTemp = Apetizer(id: 4, imageURL: "sdadad", description: "asdadadadadas", calories: 33, price: 22.00, carbs: 12, name: "asdadadada")
    
    static let apetizers = [apetizerTemp, apetizerTemp, apetizerTemp, apetizerTemp]
}
