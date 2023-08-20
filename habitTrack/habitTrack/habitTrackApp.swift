//
//  habitTrackApp.swift
//  habitTrack
//
//  Created by Yazan Ghunaim on 8/20/23.
//

import SwiftUI

@main
struct habitTrackApp: App {
    @StateObject var habitViewModel = HabitViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(habitViewModel)
        }
    }
}
