//
//  LocalStore.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 16.08.2022.
//

import Foundation
import UIKit
var charactersURL = "https://rickandmortyapi.com/api/character"
var nextPage = ""
var prevPage = ""

var arrayOfCharacters: [Result] = []

var arrayOfCharacterEpisod: [EpisodeData] = []

var curentEpisodeCharactersUrls: [String] = []
var curentEpisodeCharacters: [Result] = []
var curentEpisodeCharactersImage: [Data] = []

var arrayOfImage: [Data] = []
