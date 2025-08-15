//
//  CharacterPresenter.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 15.08.2025.
//

import Combine
import SwiftUI

// MARK: - Presenter Protocol
protocol CharacterPresenterProtocol: ObservableObject {
    var characters: [CharacterDetailModel] { get }
    var isLoading: Bool { get }

    func loadCharacters()
    func loadMoreCharacters()
}

// MARK: - Presenter Implementation
final class CharacterPresenter: CharacterPresenterProtocol {
    @Published var characters: [CharacterDetailModel] = []
    @Published var isLoading: Bool = false
    @Published var selectedCharacter: CharacterDetailModel?
    @Published var isDetailActive = false
    
    private let interactor: CharacterInteractorProtocol
    private let router: CharacterRouterProtocol
    private var currentPage = 1
    private var totalPages = 1
    
    init(interactor: CharacterInteractorProtocol,
         router: CharacterRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func loadCharacters() {
        guard !isLoading else { return }
        
        isLoading = true
        currentPage = 1
        
        Task { @MainActor in
            let response = try await interactor.fetchCharacters(page: currentPage)
            self.characters = response.results
            self.totalPages = response.info.pages
            self.isLoading = false
        }
    }
    
    func loadMoreCharacters() {
        guard !isLoading && currentPage < totalPages else { return }
        
        isLoading = true
        currentPage += 1
        
        Task { @MainActor in
            let response = try await interactor.fetchCharacters(page: currentPage)
            self.characters.append(contentsOf: response.results)
            self.isLoading = false
        }
    }
    
    func selectCharacter(_ character: CharacterDetailModel) {
        selectedCharacter = character
        isDetailActive = true
    }
    
    func getDetailView() -> AnyView {
        guard let selectedCharacter = selectedCharacter else {
            return AnyView(EmptyView())
        }
        return router.navigateToCharacterDetail(for: selectedCharacter)
    }
}
