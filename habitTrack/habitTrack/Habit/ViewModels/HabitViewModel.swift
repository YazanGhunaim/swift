//
//  HabitViewModel.swift
//  habitTrack
//
//  Created by Yazan Ghunaim on 8/20/23.
//

import Foundation

class HabitViewModel: ObservableObject {
    @Published var activites = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(activites) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "activities") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedActivities) {
                activites = decodedItems
                return
            }
        }
        
        activites = []
    }
    
    func addActivity(_ activity: Habit) {
        activites.append(activity)
    }
}
