//
//  TabBarView.swift
//  News
//
//  Created by Yazan Ghunaim on 9/5/23.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TopHeadlinesView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            Text("Saved Articles View")
                .tabItem {
                    VStack {
                        Image(systemName: "bookmark")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Saved")
                    }
                }
                .onAppear { selectedTab = 1}
                .tag(1)
        }
        .toolbarBackground(.black, for: .tabBar)
        .tint(.black)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
