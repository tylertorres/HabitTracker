//
//  Activity.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/15/23.
//

import Foundation

struct Activity : Codable, Hashable, Identifiable {
    var id: Int
    let dateCompleted: Date
    var note: String
    let habitId: Int
}

