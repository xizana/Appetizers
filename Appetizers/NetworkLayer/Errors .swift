//
//  Errors .swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import Foundation


enum AppetizersError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
    case unableToComplete
    case decodeError
}
