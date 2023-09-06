//
//  TopHeadlinesView.swift
//  News
//
//  Created by Yazan Ghunaim on 9/5/23.
//

import SwiftUI

struct TopHeadlinesView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    
                    // MARK: Title and caption
                    header
                    
                    ForEach(dummyData) { article in
                        NavigationLink {
                            NewsDetailsView(article: article)
                        } label: {
                            NewsEventCell(article: article)
                        }
                        
                        Divider()
                    }
                }
                .padding()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                // MARK: Menu button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(.black)
                    }
                }
                
                // MARK: Search Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .tint(.black)
                    }
                }
                
                // MARK: Notifications Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "bell")
                            .tint(.black)
                    }
                }
            }
        }
    }
}

struct TopHeadlinesView_Previews: PreviewProvider {
    static var previews: some View {
        TopHeadlinesView()
    }
}

extension TopHeadlinesView {
    var header: some View {
        VStack(alignment: .leading) {
            Text("Top Headlines")
                .font(.title.bold())
            
            Text("Headlines from all around the world")
                .font(.caption)
                .opacity(0.5)
        }
        .padding(.bottom, 5)
    }
}
