//
//  DerivativeExchange.swift
//  CryptoApiApp
//
//  Created by Alex Kogut on 6/11/25.
//

import Foundation

struct DerivativeExchange: Decodable, Identifiable {
    let id: String
    let name: String
    let year_established: Int?
    let country: String?
}
