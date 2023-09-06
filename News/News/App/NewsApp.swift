//
//  NewsApp.swift
//  News
//
//  Created by Yazan Ghunaim on 9/5/23.
//

import SwiftUI

@main
struct NewsApp: App {
    @StateObject var savedArticles = SavedArticles()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(savedArticles)
        }
    }
}
