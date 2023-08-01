//
//  Stylings.swift
//  iExpense
//
//  Created by Yazan Ghunaim on 8/1/23.
//

import SwiftUI

struct Stylings {
    let item: ExpenseItem
    
    var backgroundColor: Color {
        switch item.amount {
        case ..<10:
            return .yellow
        case ..<100:
            return .orange
        default:
            return .red
        }
    }
}
