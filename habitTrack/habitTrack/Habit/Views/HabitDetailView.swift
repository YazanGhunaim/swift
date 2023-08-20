//
//  HabitDetailView.swift
//  habitTrack
//
//  Created by Yazan Ghunaim on 8/20/23.
//

import SwiftUI

struct HabitDetailView: View {
    let habit: Habit
    
    var body: some View {
        VStack {
            Text(habit.title)
                .font(.title.bold())
                .padding(.top, 25)
            
            
            Text(habit.description)
                .font(.subheadline)
            
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habit: Habit(title: "Swift", description: "Complete day 47 challenge"))
    }
}
