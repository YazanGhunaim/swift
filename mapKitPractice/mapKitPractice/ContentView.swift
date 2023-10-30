//
//  ContentView.swift
//  mapKitPractice
//
//  Created by Yazan Ghunaim on 10/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mapController = MapContoller()
    
    var body: some View {
        NavigationStack {
            MapView(mapController: mapController)
        }
        .searchable(text: $mapController.searchTerm)
        .onSubmit(of: .search) {
            mapController.search()
        }
    }
}

#Preview {
    ContentView()
}
