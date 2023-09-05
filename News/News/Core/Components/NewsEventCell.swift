//
//  NewsEventCell.swift
//  News
//
//  Created by Yazan Ghunaim on 9/5/23.
//

import SwiftUI
import Kingfisher

struct NewsEventCell: View {
    let newsEvent: Article
    
    var body: some View {
        HStack(spacing: 15) {
            // MARK: News Image
            if let url = newsEvent.urlToImage {
                KFImage(URL(string: url))
                    .resizable()
                    .frame(width: 125, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .scaledToFit()
            }
            else {
                Image(systemName: "newspaper")
            }
            
            
            // MARK: News details
            VStack(alignment: .leading) {
                Text(newsEvent.source.name)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(newsEvent.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                // MARK: Author + Date
                HStack {
                    Text(newsEvent.author ?? "Yazan Ghunaim")
                    
                    Spacer()
                    
                    Text(newsEvent.publishedAt.formatted(.dateTime.day().month().year()))
                }
                .foregroundColor(.gray.opacity(0.5))
                .font(.caption)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

//struct NewsEventCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsEventCell()
//    }
//}
