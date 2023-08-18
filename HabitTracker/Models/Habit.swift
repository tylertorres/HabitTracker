//
//  Habit.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import Foundation

struct Habit : Codable, Hashable {
    let id: String
    let name: String
    var icon: String
    var userId : String?
    var completedActivities : [Activity]?
}


