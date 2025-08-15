//
//  CharacterInteractor.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 15.08.2025.
//

import Foundation

// MARK: - Interactor Protocol
protocol CharacterInteractorProtocol {
    func fetchCharacters(page: Int) async throws -> CharacterListModel
}

// MARK: - Interactor Implementation
class CharacterInteractor: CharacterInteractorProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchCharacters(page: Int) async throws -> CharacterListModel {
        let endpoint = CharacterList.getCharacters(page: page)
        return try await networkManager.fetchData(CharacterListModel.self, with: endpoint)
    }
}
