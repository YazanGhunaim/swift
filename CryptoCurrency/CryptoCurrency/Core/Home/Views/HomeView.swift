//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by Yazan Ghunaim on 12/16/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Top Movers view
                TopMoversView()
                
                Divider()
                
                // All coints View
                AllCoinsView()
            }
            .scrollIndicators(.hidden, axes: .vertical)
            .navigationTitle("Live Prices")
        }
    }
}

#Preview {
    HomeView()
}
