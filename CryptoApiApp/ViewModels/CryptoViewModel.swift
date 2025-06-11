//
//  CryptoViewModel.swift
//  CryptoApiApp
//
//  Created by Alex Kogut on 6/11/25.
//

import Foundation
import SwiftUI

@MainActor
final class CryptoViewModel: ObservableObject {
    enum DataType: String, CaseIterable, Identifiable {
        case coins = "Coins"
        case exchanges = "Exchanges"
        var id: String { self.rawValue }
    }

    @Published var selectedType: DataType = .coins
    @Published var coins: [CoinMarket] = []
    @Published var exchanges: [DerivativeExchange] = []
    @Published var showAlert: Bool = false
    
    func fetchData() {
        switch selectedType {
        case .coins:
            fetchCoins()
        case .exchanges:
            fetchExchanges()
        }
    }
    
    private func fetchCoins() {
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
            responseType: [CoinMarket].self
        ) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.coins = data
                case .failure:
                    self?.showAlert = true
                }
            }
        }
    }

    private func fetchExchanges() {
        NetworkService.shared.load(
            path: .derivativesExchanges, queryItems: [],
            responseType: [DerivativeExchange].self
        ) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.exchanges = data
                case .failure:
                    self?.showAlert = true
                }
            }
        }
    }
}
