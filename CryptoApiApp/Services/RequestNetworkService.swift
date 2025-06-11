//
//  RequestNetworkService.swift
//  CryptoApiApp
//
//  Created by Alex Kogut on 6/11/25.
//

import Foundation

final class RequestNetworkService {
    static func fetchMarketData(completion: @escaping (Result<[CoinMarket], Error>) -> Void) {
        let query = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "order", value: "market_cap_desc"),
            URLQueryItem(name: "per_page", value: "10"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "sparkline", value: "false")
        ]
        
        NetworkService.shared.load(
            path: .coinsMarkets,
            queryItems: query,
            responseType: [CoinMarket].self,
            completion: completion
        )
    }

    static func fetchExchangeData(completion: @escaping (Result<[DerivativeExchange], Error>) -> Void) {
        NetworkService.shared.load(
            path: .derivativesExchanges, queryItems: [],
            responseType: [DerivativeExchange].self,
            completion: completion
        )
    }
}
