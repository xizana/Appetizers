//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import Foundation


final class NetworkManager {
    // MARK: - Properties
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"

    private let apetizerURL = baseURL + "apetizers"
    
    // MARK: - init

    private init() {
        
    }
    
    // MARK: - Functions
    
    func getAppetizers(completion: @escaping (Result<[Apetizer], ApetizersError>) -> Void ) {
        guard let url = URL(string: apetizerURL) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let tast = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let error = error else {
                completion(.failure(.unableToComplete))
                return
            }
            guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ApetizerResponse.self, from: data)
                completion(.success(decodedResponse.request))
            } catch {
                completion(.failure(.decodeError))
            }
        }
        
        tast.resume()
    }

    
}
