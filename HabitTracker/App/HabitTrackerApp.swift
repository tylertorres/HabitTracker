//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    
    @StateObject private var model = HabitsModel()
    
    var body: some Scene {
        WindowGroup {
            HabitsList(model: model)
                .environment(\.colorScheme, .light)
        }
    }
}

