//
//  Question.swift
//  edutainment
//
//  Created by Yazan Ghunaim on 7/28/23.
//

import SwiftUI

struct Question: Equatable, Hashable {
    let multiplicand: Int
    let multiplier: Int
    
    var question: String {
        return "What is \(multiplicand) * \(multiplier) ?"
    }
    
    var answer: Int {
        return multiplicand * multiplier
    }
    
    var options: [Int] {
        var allOptions = [answer]
        
        while allOptions.count < 3 {
            let randomOption = Int.random(in: 5...150)
            
            if !allOptions.contains(randomOption) {
                allOptions.append(randomOption)
            }
        }
        
        return allOptions.shuffled()
    }
    
    init(multiplicand: Int, multiplier: Int) {
        self.multiplicand = multiplicand
        self.multiplier = multiplier
    }
    
    static func ==(lhs: Question, rhs: Question) -> Bool {
        return lhs.multiplicand == rhs.multiplicand && lhs.multiplier == rhs.multiplier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(multiplicand)
        hasher.combine(multiplier)
    }
}
