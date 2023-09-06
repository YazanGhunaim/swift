//
//  SavedArticlesView.swift
//  News
//
//  Created by Yazan Ghunaim on 9/6/23.
//

import SwiftUI

struct SavedArticlesView: View {
    @EnvironmentObject var savedArticles: SavedArticles
    @State private var showConfirmation = false
    
    var body: some View {
        if savedArticles.existBookmarks {
            NavigationStack {
                VStack {
                    ScrollView {
                        LazyVStack {
                            ForEach(savedArticles.bookmarkedArticles) { article in
                                NavigationLink {
                                    NewsDetailsView(article: article)
                                } label: {
                                    NewsEventCell(article: article)
                                }
                                
                                Divider()
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Saved Articles")
                .toolbar {
                    ToolbarItem {
                        Button {
                            showConfirmation = true
                        } label: {
                            Text("Delete all")
                        }
                        .tint(.red)
                        
                    }
                }
                .alert("Are you sure?", isPresented: $showConfirmation) {
                    Button("no", role: .cancel) { showConfirmation = false }
                    Button("yes", role: .destructive) { savedArticles.emptyList() }
                }
            }
        } else {
            nothingHere
        }
    }
}

struct SavedArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedArticlesView()
    }
}

extension SavedArticlesView {
    var nothingHere: some View {
        VStack(spacing: 10) {
            Text("Uh oh .. nothing here!")
                .font(.largeTitle)
            Text("try bookmarking a news article first!")
                .font(.subheadline)
        }
    }
}
