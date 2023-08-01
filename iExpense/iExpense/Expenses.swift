//
//  Expenses.swift
//  iExpense
//
//  Created by Yazan Ghunaim on 7/29/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var personalItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "personalItems")
            }
        }
    }
    
    @Published var businessItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "businessItems")
            }
        }
    }
    
    init() {
        if let savedPersonalItems = UserDefaults.standard.data(forKey: "personalItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedPersonalItems) {
                personalItems = decodedItems
                print(personalItems)
            }
        }
        
        if let savedBusinessItems = UserDefaults.standard.data(forKey: "businessItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusinessItems) {
                businessItems = decodedItems
                print(businessItems)
            }
        } else {
            personalItems = []
            businessItems = []
        }
    }
}
