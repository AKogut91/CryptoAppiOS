//
//  ContentView.swift
//  CryptoApiApp
//
//  Created by Alex Kogut on 6/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CryptoViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Data Type", selection: $viewModel.selectedType) {
                    ForEach(CryptoViewModel.DataType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List {
                    if viewModel.selectedType == .coins {
                        ForEach(viewModel.coins) { coin in
                            HStack {
                                AsyncImage(url: URL(string: coin.image)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 30, height: 30)
                                
                                VStack(alignment: .leading) {
                                    Text(coin.name)
                                    Text("$\(coin.current_price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    } else {
                        ForEach(viewModel.exchanges) { exchange in
                            VStack(alignment: .leading) {
                                Text(exchange.name)
                                    .font(.headline)
                                Text("Country: \(exchange.country ?? "Unknown")")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                if let year = exchange.year_established {
                                    Text("Since \(year)")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Crypto Info")
        }
        .onAppear {
            viewModel.fetchData()
        }
        .onChange(of: viewModel.selectedType) { _ in
            viewModel.fetchData()
        }
        .alert("Request is Failured", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}
