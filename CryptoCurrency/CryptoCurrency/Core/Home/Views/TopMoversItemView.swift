//
//  SwiftUIView.swift
//  CryptoCurrency
//
//  Created by Yazan Ghunaim on 12/16/23.
//

import SwiftUI

struct TopMoversItemView: View {
    var body: some View {
        VStack(alignment: .leading){
            // image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .tint(.orange)
                .padding(.bottom, 10)
            
            // coint info
            HStack(spacing: 2) {
                Text("BTC")
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text("$20,330.00")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            // percent change
            Text("+ 5.60%")
                .font(.title2)
                .foregroundStyle(.green)
        }
        .frame(width: 140, height: 140)
        .overlay (
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        )
    }
}

#Preview {
    TopMoversView()
}
