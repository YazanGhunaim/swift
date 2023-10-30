//
//  Action.swift
//  mapKitPractice
//
//  Created by Yazan Ghunaim on 10/30/23.
//

import Foundation

struct Action: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let handler: () -> Void
}
