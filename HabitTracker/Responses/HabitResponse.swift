//
//  HabitResponse.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/29/23.
//

import Foundation


struct HabitResponse : Codable, Hashable {
    let habits : [Habit]?
}
