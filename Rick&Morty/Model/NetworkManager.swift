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
        URLSession.shared.dataTask(with: request) { data, _, error in
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

    func fetchEpisodeData(url: String, completion: @escaping (EpisodeData) -> Void) {
        guard let request = URL(string: url) else { return }
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            do {
                let episode = try JSONDecoder().decode(EpisodeData.self, from: data)
                completion(episode)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

    func fetchDataResult(url: String, completion: @escaping (Result) -> Void) {
        guard let request = URL(string: url) else { return }
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            do {
                let characters = try JSONDecoder().decode(Result.self, from: data)
                completion(characters)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

    func loadImages(url: String, completion: @escaping () -> Void) {
            let imageURL = URL(string: url)
            guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
            arrayOfImage.append(imageData)
            completion()
    }

    func loadImages2(url: String, completion: @escaping () -> Void) {
            let imageURL = URL(string: url)
            guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
            curentEpisodeCharactersImage.append(imageData)
            completion()
    }
}
