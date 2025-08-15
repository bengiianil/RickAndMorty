//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 14.08.2025.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var scheme: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    var scheme: String {
        "https"
    }
    
    var baseURL: String {
        "rickandmortyapi.com"
    }
    
    var headers: [String: String]? {
        [HTTPHeader.contentType.rawValue: "application/json"]
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    func  createURLRequest() -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = baseURL
        urlComponents.path = path
        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else { return nil }
        
        var requestURL = URLRequest(url: url)
        requestURL.httpMethod = httpMethod.rawValue
        requestURL.allHTTPHeaderFields = headers
        
        return requestURL
    }
}
