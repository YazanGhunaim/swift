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
            VStack(alignment: .leading) {
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(alignment: .leading) {
                        ForEach(dummyData) { event in
                            NavigationLink {
                                Text("News Detail View")
                            } label: {
                                NewsEventCell(newsEvent: event)
                            }
                            
                            Divider()
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Top Headlines")
//            .navigationBarTitleDisplayMode(.inline)
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
