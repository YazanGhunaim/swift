//
//  AllCoinsView.swift
//  CryptoCurrency
//
//  Created by Yazan Ghunaim on 12/16/23.
//

import SwiftUI

struct AllCoinsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
        
            HStack {
                Text("Coin")
                
                Spacer()
                
                Text("Prices")
            }
            .font(.caption)
            .foregroundStyle(.gray)
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ForEach( 0 ..< 50, id: \.self) { _ in
                        CoinRowView()
                    }
                }
            }
        }
    }
}

#Preview {
    AllCoinsView()
}
