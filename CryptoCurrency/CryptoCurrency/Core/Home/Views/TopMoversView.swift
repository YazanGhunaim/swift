//
//  TopMoversView.swift
//  CryptoCurrency
//
//  Created by Yazan Ghunaim on 12/16/23.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            
            ScrollView {
                HStack(spacing: 15) {
                    ForEach(0 ..< 5, id: \.self) { _ in
                        TopMoversItemView()
                    }
                }
            }
            .scrollIndicators(.automatic, axes: .horizontal)
        }
    }
}

#Preview {
    TopMoversView()
}
