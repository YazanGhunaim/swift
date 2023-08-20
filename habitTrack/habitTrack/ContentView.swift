//
//  ContentView.swift
//  habitTrack
//
//  Created by Yazan Ghunaim on 8/20/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var habitViewModel: HabitViewModel
    @State private var detailSheetPresented = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15) {
                habitList
            }
            .navigationTitle("HabitTrack")
            .sheet(isPresented: $detailSheetPresented, content: {
                AddHabitFormView()
            })
            .toolbar {
                
                // MARK: Edit Button
                ToolbarItem {
                    EditButton()
                        .tint(.red)
                }
                
                // MARK: Add Button
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        detailSheetPresented.toggle()
                    } label: {
                        Text("Add")
                    }
                }
                
            }
        }
    }
}

extension ContentView {
    var habitList: some View {
        // MARK: habit list
        List {
            ForEach(habitViewModel.activites) { habit in
                HabitCellView(habit: habit)
            }
            .onDelete(perform: removeRows)
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        habitViewModel.activites.remove(atOffsets: offsets)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
