//
//  NewsDetailsView.swift
//  News
//
//  Created by Yazan Ghunaim on 9/6/23.
//

import SwiftUI
import Kingfisher

struct NewsDetailsView: View {
    @EnvironmentObject var savedArticles: SavedArticles
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: Author and published date details
            authorAndDateDetails
            
            // MARK: Article title and description
            titleAndDescription
            
            ScrollView {
                // MARK: News Image
                if let url = article.urlToImage {
                    NewsImage(url: url)
                }
                
                // MARK: Article Content
                Text(article.content ?? "Content Not Found")
                    .padding()
            }
            
            Spacer()
        }
        .navigationTitle(article.source.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            // MARK: Bookmark article button
            Button {
                savedArticles.bookmarkArticle(forArticle: article)
            } label: {
                Image(systemName: savedArticles.articleAlreadyBookmarked(forArticle: article) ? "bookmark.fill" : "bookmark")
            }
            
        }
    }
}

//struct NewsDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            NewsDetailsView(article: Article(
//                source: Source(id: "cnn", name: "CNN"),
//                author: "John Doe",
//                title: "Breaking News: COVID-19 Vaccine Approved",
//                description: "The COVID-19 vaccine has been approved for widespread distribution.",
//                url: "https://www.cnn.com/news/covid-19-vaccine-approved",
//                urlToImage: "https://image.cnbcfm.com/api/v1/image/107294516-1693495171428-gettyimages-1650708091-img_8114_widhmesr.jpeg?v=1693865312&w=1920&h=1080",
//                publishedAt: Date(),
//                content: "In a major development, the COVID-19 vaccine has been approved for widespread distribution, offering hope in the fight against the pandemic."
//            ))
//        }
//    }
//}


extension NewsDetailsView {
    var authorAndDateDetails: some View {
        HStack {
            Text("Author:\n\(article.author ?? "Unknown")")
            
            Spacer()
            
            Text("Date:\n\(article.formattedDate)")
        }
        .padding()
        .font(.footnote)
        .opacity(0.5)
    }
    
    var titleAndDescription: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text(article.title ?? "no title" )
                .font(.title)
            
            Text(article.description ?? " no desc")
                .font(.footnote)
                .opacity(0.7)
        }
        .padding(.horizontal)
    }
}

struct NewsImage: View {
    let url: String
    
    var body: some View {
        KFImage(URL(string: url))
            .resizable()
            .frame(maxWidth: .infinity)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.5), radius: 5)
            .padding()
    }
}
