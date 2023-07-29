//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Yazan Ghunaim on 7/29/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable { // can be identified, only requirement is to have id
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
