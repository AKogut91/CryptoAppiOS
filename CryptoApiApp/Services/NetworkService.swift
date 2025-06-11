//
//  NetworkService.swift
//  CryptoApiApp
//
//  Created by Alex Kogut on 6/11/25.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    func load<T: Decodable>(path: API.Path, queryItems: [URLQueryItem], responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        var components = URLComponents(string: API.baseURL + path.rawValue)!
        components.queryItems = queryItems
        
        guard let url = components.url else {
            completion(.failure(URLError(.badURL)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
