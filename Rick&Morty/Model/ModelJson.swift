//
//  ModelJson.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 16.08.2022.
//

import Foundation

struct Characters: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let id: Int
    let name: String
    let species: String
    let gender: String
    let image: String
}
