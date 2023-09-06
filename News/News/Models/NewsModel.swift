//
//  NewsModel.swift
//  News
//
//  Created by Yazan Ghunaim on 9/5/23.
//
import Foundation

// MARK: Response
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable, Equatable {
    let source: Source
    let author: String?
    let title, description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    
    var id: String {
        return url
    }
    
    var formattedDate: String {
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: publishedAt) ?? Date.now
        return date.formatted(.dateTime.day().month().year())
    }
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.url == rhs.url &&
        lhs.publishedAt == rhs.publishedAt
        // Add other properties as needed for comparison
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
