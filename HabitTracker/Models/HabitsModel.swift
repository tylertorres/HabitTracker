//
//  HabitsModel.swift
//  HabitTracker
//
//  Created by Tyler Torres on 1/2/24.
//

import Foundation
import SwiftUI

class HabitsModel: ObservableObject {
    
    @Published var habits: [Habit]
    
    @Published var destination: Destination?
    @Published var path: NavigationPath
    
    init(habits: [Habit] = [],
         destination: Destination? = nil,
         navigationPath: NavigationPath = NavigationPath()) {
        self.habits = habits
        self.destination = destination
        self.path = NavigationPath()
    }
    
    func addHabitButtonTapped() {
        self.destination = .addHabit(AddHabitModel())
    }
    
    func dismissButtonTapped() {
        self.destination = nil
    }
    
    func confirmButtonTapped() {
        defer { self.destination = nil }
        
        guard case let .addHabit(model) = self.destination else { return }
        
        let habitName = model.habitTextInput
        let habitTheme = model.selectedThemeColor
        
        let habitToBeCreated = Habit(name: habitName, theme: habitTheme, completedActivities: [])
        self.habits.append(habitToBeCreated)
    }
    
}


extension HabitsModel {
    
    enum Destination: Identifiable {
        
        case addHabit(AddHabitModel)
        
        var id: UUID {
            switch self {
            case .addHabit(let model):
                return model.id
            }
        }
        
        
    }
}
