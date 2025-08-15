//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 14.08.2025.
//

import Foundation

enum CharacterList: Endpoint {
    case getCharacters(page: Int)

    var path: String {
        switch self {
        case .getCharacters:
            "/api/character"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getCharacters(let page):
            return [URLQueryItem(name: "page", value: "\(page)")]
        }
    }
}
