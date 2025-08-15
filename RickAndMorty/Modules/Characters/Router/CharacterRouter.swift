//
//  CharacterRouter.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 15.08.2025.
//

import Foundation
import Combine
import SwiftUI

// MARK: - Router Protocol
protocol CharacterRouterProtocol {
    func navigateToCharacterDetail(for character: CharacterDetailModel) -> AnyView
}

// MARK: - Router Implementation
final class CharacterRouter: CharacterRouterProtocol {
    func navigateToCharacterDetail(for character: CharacterDetailModel) -> AnyView {
        AnyView(CharacterDetailView(character: character))
    }
}
