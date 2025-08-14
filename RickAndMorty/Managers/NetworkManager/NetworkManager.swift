//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 14.08.2025.
//

import Foundation

import Foundation

protocol NetworkManagerProtocol {
    func fetchData<T: Codable>(_ response: T.Type, with endpoint: any Endpoint) async throws -> T
    func postData<T: Codable, U: Codable>(_ response: T.Type, body: U?, with endpoint: any Endpoint) async throws -> T
}

class NetworkManager: NetworkManagerProtocol {
    private let urlSession: URLSession
    
    private lazy var jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()
    
    private lazy var jsonEncoder: JSONEncoder = {
       let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted]
        return jsonEncoder
    }()
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchData<T: Codable>(_ response: T.Type, with endpoint: any Endpoint) async throws -> T {
         
        guard let url = endpoint.createURLRequest() else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await urlSession.data(for: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.failedResponse(statusCode: httpResponse.statusCode)
        }
        
        do {
            let decodedResponse = try jsonDecoder.decode(T.self, from: data)
            
            if let data = try? jsonEncoder.encode(decodedResponse),
               let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }
            
            return decodedResponse
        } catch {
            throw NetworkError.failedDecoding(errorDescription: error.localizedDescription)
        }
    }
    
    func postData<T: Codable, U: Codable>(_ response: T.Type, body: U? = nil, with endpoint: any Endpoint) async throws -> T {
        
        guard var urlRequest = endpoint.createURLRequest() else {
            throw NetworkError.invalidURL
        }
        
        if let body = body {
            do {
                let bodyData = try jsonEncoder.encode(body)
                urlRequest.httpBody = bodyData
            } catch {
                throw NetworkError.failedEncoding(errorDescription: error.localizedDescription)
            }
        }
        
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.failedResponse(statusCode: httpResponse.statusCode)
        }
        
        do {
            let decodedResponse = try jsonDecoder.decode(T.self, from: data)
            
            if let data = try? jsonEncoder.encode(decodedResponse),
               let jsonString = String(data: data, encoding: .utf8) {
                print("Response: \(jsonString)")
            }
            
            return decodedResponse
        } catch {
            throw NetworkError.failedDecoding(errorDescription: error.localizedDescription)
        }
    }
}
