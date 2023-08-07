//
//  HabitsViewModel.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/4/23.
//

import Foundation
import Iconoir
import UIKit

class HabitsViewModel : ObservableObject {
    // View Models let you separate out logic from the UI layer
    @Published var habits : [Habit] = [
        Habit(id: 1, name: "Read 10 Pages", icon: Iconoir.refresh.rawValue),
        Habit(id: 1, name: "Walk a Mile", icon: Iconoir.refresh.rawValue),
        Habit(id: 1, name: "Code 1 component", icon: Iconoir.refresh.rawValue),
        Habit(id: 1, name: "Learn Spanish", icon: Iconoir.refresh.rawValue),
        Habit(id: 1, name: "Learn Latin", icon: Iconoir.refresh.rawValue),
    ]
    
    @Published var showAddHabitSheet: Bool = false
    @Published var habitNameInput: String = ""
    @Published var selectedIcon: Iconoir = Iconoir.refresh
    
    func saveNewHabit() async {
        guard let device_id = await UIDevice.current.identifierForVendor else { return }
        
        do {
            try await APIClient.shared.saveHabit(user: device_id, habitName: habitNameInput)
            habits.append(Habit(id: habits.count + 1, name: habitNameInput, icon: selectedIcon.rawValue))
            clearInput()
        } catch {
            print(error)
        }
    }
    
    func saveNewHabit2() {
        guard let device_id = UIDevice.current.identifierForVendor else { return }
        
        // Optimistic UI
        let newHabit = Habit(id: habits.count + 1, name: habitNameInput, icon: selectedIcon.rawValue)
        habits.append(newHabit)
        clearInput()
        
        print("Locally added new habit")
        
        Task {
            do {
                try await APIClient.shared.saveHabit(user: device_id, habitName: habitNameInput)
                print("Remotely added New Habit")
            } catch {
                print(error)
            }
        }
    }
    
    private func clearInput() {
        habitNameInput = ""
        selectedIcon = Iconoir.refresh
        showAddHabitSheet = false
    }
}
