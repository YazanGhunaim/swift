//
//  CoinRowView.swift
//  CryptoCurrency
//
//  Created by Yazan Ghunaim on 12/16/23.
//

import SwiftUI

struct CoinRowView: View {
    var body: some View {
        HStack {
            // market cap rank
            Text("1")
                .font(.caption)
                .foregroundStyle(.gray)
            
            // image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
            
            // coin name info
            VStack(alignment: .leading, spacing: 5) {
                Text("Bitcoin")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 5)
                
                Text("BTC")
                    .font(.caption)
                    .padding(.leading, 5)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            // coin price info
            VStack(alignment: .trailing, spacing: 5) {
                Text("$20,330,00")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 5)
                
                Text("-5.60%")
                    .font(.caption)
                    .padding(.leading, 5)
                    .foregroundStyle(.red)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

#Preview {
    CoinRowView()
}
