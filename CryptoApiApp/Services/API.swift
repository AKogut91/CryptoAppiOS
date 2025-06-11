//
//  API.swift
//  CryptoApiApp
//
//  Created by Alex Kogut on 6/11/25.
//

import Foundation

struct API {
    static let baseURL = "https://api.coingecko.com/api/v3/"
    
    enum Path: String {
        case coinsMarkets = "coins/markets"
        case derivativesExchanges = "derivatives/exchanges"
    }
}
