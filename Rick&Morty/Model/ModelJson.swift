//
//  ModelJson.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 16.08.2022.
//

import Foundation

struct Characters: Decodable {
    let info: Info
    let results: [Result]
}

struct Info: Decodable {
    let next: String
    let prev: String?
}

struct Result: Decodable {
    let id: Int
    let name: String
    let species: String
    let gender: String
    let image: String
    let origin: Origin
    let location: Location
}

struct Origin: Decodable {
    let name: String
}

struct Location: Decodable {
    let name: String
}
