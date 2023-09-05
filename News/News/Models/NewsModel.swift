//
//  NewsModel.swift
//  News
//
//  Created by Yazan Ghunaim on 9/5/23.
//
import Foundation


// MARK: - Article
struct Article: Codable, Identifiable {
    var id = UUID()
    let source: Source
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
