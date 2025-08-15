//
//  PreviewProvider.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 14.08.2025.
//

import Foundation

final class PreviewProvider {
    
    static let shared = PreviewProvider()

    private init() { }
    
    let character: [CharacterDetailModel] = [
        .init(id: 2,
              name: "Morty Smith",
              status: "Alive",
              species: "Human",
              image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
              episode: ["https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2"])
    ]
}
