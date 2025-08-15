//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 14.08.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case failedResponse(statusCode: Int)
    case failedDecoding(errorDescription: String)
    case failedEncoding(errorDescription: String)
    case unknownError

    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .failedResponse(let statusCode):
            return "Failed with status code: \(statusCode)"
        case .failedDecoding(let errorDescription):
            return "Decode Failed Error: \(errorDescription)"
        case .failedEncoding(let errorDescription):
            return "Encode Failed Error: \(errorDescription)"
        case .unknownError:
            return "Unknown Error"
        }
    }
}
