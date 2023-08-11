//
//  ContentView.swift
//  MoonShot
//
//  Created by Yazan Ghunaim on 8/3/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = false
    
    var body: some View {
        NavigationView {
            
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("MoonShot")
            .background(.darkBackGround)
            .preferredColorScheme(.dark)
            
            .toolbar {
                ToolbarItem {
                    Button {
                        showingGrid.toggle()
                    } label: {
                        showingGrid == true ? Text("List View").foregroundColor(.white) : Text("Grid View").foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
