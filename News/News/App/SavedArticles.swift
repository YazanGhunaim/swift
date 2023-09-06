//
//  savedArticles.swift
//  News
//
//  Created by Yazan Ghunaim on 9/6/23.
//

import Foundation
import SwiftUI

class SavedArticles: ObservableObject {
    @Published var bookmarkedArticles = [Article]()
    
    var existBookmarks: Bool {
        return !bookmarkedArticles.isEmpty
    }
    
    func articleAlreadyBookmarked(forArticle article: Article) -> Bool {
        bookmarkedArticles.contains(article)
    }
    
    func bookmarkArticle(forArticle article: Article) {
        if let index = bookmarkedArticles.firstIndex(of: article) {
            bookmarkedArticles.remove(at: index)
        } else {
            bookmarkedArticles.append(article)
        }
    }
    
    func emptyList() {
        bookmarkedArticles.removeAll()
    }
}
