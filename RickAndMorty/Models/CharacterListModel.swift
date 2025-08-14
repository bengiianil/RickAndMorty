//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 14.08.2025.
//

import Foundation

// MARK: - Characters Response
struct CharacterListModel: Codable {
    let info: Info
    let results: [CharacterDetailModel]
}

// MARK: - Info
struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Character Detail Model
struct CharacterDetailModel: Codable {
    let id: Int
    let name: String?
    let status: String?
    let image: String?
    let episode: [String]?
}

// MARK: - Location Info Model
struct LocationInfo: Codable {
    let name: String?
    let url: String?
}
