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
    @Published var habits = [Habit]()
    @Published var showAddHabitSheet: Bool = false
    @Published var habitNameInput: String = ""
    @Published var selectedIcon: Iconoir = Iconoir.refresh
    @Published var showAddActivitySheet: Bool = false
    
    func loadHabitsFromUserDefaults() {
        print("Loading habits...")
        guard let userId = UIDevice.current.identifierForVendor?.uuidString else { return }

        let habits = APIClient.shared.getHabitsFromUserDefaults(for: userId)
        
        guard let habits else { return }
        
        print(habits)
        
        updateUI(with: habits)
    }
    
    func saveHabitToUserDefaults() {
        guard let userId = UIDevice.current.identifierForVendor?.uuidString else { return }
        
        let newHabit = Habit(id: UUID().uuidString, name: habitNameInput, icon: selectedIcon.rawValue)
        habits.append(newHabit)
        APIClient.shared.saveToUserDefaults(userId, newHabit)
        
        clearInput()
    }
    
    private func updateUI(with habits: [Habit]) {
        DispatchQueue.main.async { [weak self] in
            self?.habits = habits
        }
    }
    
    private func clearInput() {
        habitNameInput = ""
        selectedIcon = Iconoir.refresh
        showAddHabitSheet = false
    }
}
