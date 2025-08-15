//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 15.08.2025.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var presenter: CharacterPresenter
    private let router: CharacterRouter
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        let router = CharacterRouter()
        let interactor = CharacterInteractor(networkManager: networkManager)
        let presenter = CharacterPresenter(interactor: interactor, router: router)
        
        self._presenter = StateObject(wrappedValue: presenter)
        self.router = router
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if presenter.isLoading && presenter.characters.isEmpty {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if presenter.characters.isEmpty && !presenter.isLoading {
                    Text("Character not found.")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                         LazyVGrid(columns: [
                             GridItem(.flexible(), spacing: 8),
                             GridItem(.flexible(), spacing: 8)
                         ], spacing: 16) {
                             ForEach(presenter.characters) { character in
                                
                                 CharacterCardView(character: character) {
                                     presenter.selectCharacter(character)
                                 }
                                 .onAppear {
                                     if character.id == presenter.characters.last?.id {
                                         presenter.loadMoreCharacters()
                                     }
                                 }
                             }
                         }
                         .padding(.horizontal)
                         
                         if presenter.isLoading && !presenter.characters.isEmpty {
                             ProgressView()
                                 .scaleEffect(1.2)
                                 .padding()
                         }
                     }
                    .background(
                        NavigationLink(
                            destination: presenter.getDetailView(),
                            isActive: $presenter.isDetailActive
                        ) { EmptyView() }
                        .hidden()
                    )
                }
            }
            .navigationTitle("Rick & Morty")
            .onAppear {
                presenter.loadCharacters()
            }
        }
    }
}
