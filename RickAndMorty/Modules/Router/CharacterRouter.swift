//
//  CharacterRouter.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 15.08.2025.
//

import Foundation

// MARK: - Router Protocol
protocol CharacterRouterProtocol {
    func navigateToCharacterDetail(_ character: CharacterDetailModel)
}

// MARK: - Router Implementation
class CharacterRouter: CharacterRouterProtocol {
    func navigateToCharacterDetail(_ character: CharacterDetailModel) {
        // navigate to another page
    }
}
