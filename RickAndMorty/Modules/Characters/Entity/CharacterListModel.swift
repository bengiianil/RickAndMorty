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

// MARK: - Info Model
struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Character Detail Model
struct CharacterDetailModel: Codable, Identifiable, Hashable {
    let id: Int
    let name: String?
    let status: String?
    let species: String?
    let image: String?
    let episode: [String]?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
