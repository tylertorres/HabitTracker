//
//  Habit.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import Foundation

struct Habit : Codable, Hashable {
    let name : String
    var datesCompleted : [Date]
}
