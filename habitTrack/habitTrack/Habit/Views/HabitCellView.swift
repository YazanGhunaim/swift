//
//  HabitCellView.swift
//  habitTrack
//
//  Created by Yazan Ghunaim on 8/20/23.
//

import SwiftUI

struct HabitCellView: View {
    let habit: Habit
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(habit.title)
                .font(.title3)
            
            Text("Description: \(habit.description)")
                .font(.footnote.bold())
                .foregroundColor(.gray)
        }
    }
}

struct HabitCellView_Previews: PreviewProvider {
    static var previews: some View {
        HabitCellView(habit: Habit(title: "Swift", description: "Hacking with swift day 47"))
    }
}
