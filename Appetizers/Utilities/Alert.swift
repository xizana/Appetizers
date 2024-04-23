//
//  Alert.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 23.04.24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let  invalidUrl = AlertItem(title: Text("Server Error"), message: Text("Invalid URL. Please try again later."), dismissButton: .default(Text("Ok")))

    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from server. Please try again later."), dismissButton: .default(Text("Ok")))
    
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data sent from server is invalid. Please contact support."), dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request. Please try again later."), dismissButton: .default(Text("Ok")))
    
    static let decodeError = AlertItem(title: Text("Server Error"), message: Text("Can not parse data. Please try again later."), dismissButton: .default(Text("Ok")))
}


