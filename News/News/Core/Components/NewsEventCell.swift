//
//  NewsEventCell.swift
//  News
//
//  Created by Yazan Ghunaim on 9/5/23.
//

import SwiftUI
import Kingfisher

struct NewsEventCell: View {
    let article: Article
    
    var body: some View {
        HStack(spacing: 15) {
            // MARK: News Image
            if let url = article.urlToImage {
                KFImage(URL(string: url))
                    .resizable()
                    .frame(width: 125, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .scaledToFit()
            }
            else {
                Image(systemName: "newspaper")
                    .frame(width: 125, height: 100)
            }
            
            
            // MARK: News details
            VStack(alignment: .leading) {
                Text(article.source.name)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(article.title ?? "no title")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                // MARK: Author + Date
                HStack {
                    Text(article.author ?? "Yazan Ghunaim")
                    
                    Spacer()
                    
                    Text(article.formattedDate)
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
