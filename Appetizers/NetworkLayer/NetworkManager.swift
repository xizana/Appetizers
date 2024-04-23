//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import UIKit


final class NetworkManager {
    // MARK: - Properties
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let apetizerURL = baseURL + "appetizers"
    
    // MARK: - init
    
    private init() {
        
    }
    
    // MARK: - Functions
    
    func getAppetizers(completion: @escaping (Result<[Appetizer], AppetizersError>) -> Void ) {
        guard let url = URL(string: apetizerURL) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let tast = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
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
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completion(.success(decodedResponse.request))
            } catch {
                completion(.failure(.decodeError))
            }
        }
        
        tast.resume()
    }
    
    
    func getImage(fromUrlString urlString: String, completion: @escaping (UIImage?) -> Void ) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let tast = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data , let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completion(image )
        }
        tast.resume()
    }
}
