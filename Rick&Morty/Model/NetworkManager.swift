//
//  NetworkManager.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 16.08.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(url: String, completion: @escaping (Characters) -> Void) {
        guard let request = URL(string: url) else { return }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            do {
                let characters = try JSONDecoder().decode(Characters.self, from: data)
                completion(characters)
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
