//
//  AddHabitFormView.swift
//  habitTrack
//
//  Created by Yazan Ghunaim on 8/20/23.
//

import SwiftUI

struct AddHabitFormView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var habitViewModel: HabitViewModel
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Activity Title") {
                    TextField("Title", text: $title)
                }
                
                Section("Activity Description") {
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Add activity")
            .toolbar {
                ToolbarItem {
                    Button("dismiss") {
                        dismiss()
                    }
                    .tint(.red)
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        habitViewModel.addActivity(Habit(title: title, description: description))
                        dismiss()
                    } label: {
                        Text("Submit")
                    }
                }
            }
        }
    }
}

struct AddHabitFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitFormView()
    }
}
