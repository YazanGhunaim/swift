//
//  ContentView.swift
//  iExpense
//
//  Created by Yazan Ghunaim on 7/29/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    let preferences = UserPreferences()
    
    var body: some View {
        NavigationView {
            
            List {
                Section(header: Text("Personal Items")) {
                    ForEach(expenses.personalItems) { item in
                        ListCell(item: item, currencyCode: preferences.currency ?? "USD")
                    }
                    .onDelete(perform: removePersonalItems)
                }
                
                Section(header: Text("Business Items")) {
                    ForEach(expenses.businessItems) { item in
                        ListCell(item: item, currencyCode: preferences.currency ?? "USD")
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        expenses.personalItems.remove(atOffsets: offsets)
    }
    func removeBusinessItems(at offsets: IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    let item: ExpenseItem
    let currencyCode: String
    
    var body: some View {
        HStack
        {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                
                Text(item.type)
            }
            
            Spacer()
            
            Text(item.amount, format: .currency(code: currencyCode))
                .foregroundColor(Stylings.init(item: item).backgroundColor)
        }
    }
}
