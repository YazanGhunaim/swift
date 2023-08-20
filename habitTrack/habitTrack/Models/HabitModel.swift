//
//  HabitModel.swift
//  habitTrack
//
//  Created by Yazan Ghunaim on 8/20/23.
//

import Foundation

struct Habit: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
}
