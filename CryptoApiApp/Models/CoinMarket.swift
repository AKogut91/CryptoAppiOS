//
//  CoinMarket.swift
//  CryptoApiApp
//
//  Created by Alex Kogut on 6/11/25.
//

import Foundation

struct CoinMarket: Decodable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let current_price: Double
    let image: String
}
