//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 14.08.2025.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryParameters: [String: String]? { get }
}

extension Endpoint {
    var baseURL: String {
        "https://rickandmortyapi.com"
    }
    
    var headers: [String: String]? {
        [HTTPHeader.contentType.rawValue: "application/json"]
    }
    
    var queryParameters: [String: String]? {
        nil
    }
    
    func  createURLRequest() -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.host = baseURL
        urlComponents.path = path
        
        if let queryParameters = queryParameters {
            urlComponents.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = urlComponents.url else { return nil }
        
        var requestURL = URLRequest(url: url)
        requestURL.httpMethod = httpMethod.rawValue
        requestURL.allHTTPHeaderFields = headers
        
        return requestURL
    }
}
