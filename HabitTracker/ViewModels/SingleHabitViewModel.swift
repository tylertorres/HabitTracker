//
//  SingleHabitViewModel.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/7/23.
//

import Foundation

class SingleHabitViewModel : ObservableObject {
    
    @Published var activityStore: [Activity] = [
        Activity(id: 1, dateCompleted: .now, note: "", habitId: UUID().uuidString),
        Activity(id: 2, dateCompleted: .now.subtracting(days: 5), note: "this is a note v2", habitId: UUID().uuidString)
    ]
    @Published var showAddActivitySheet: Bool = false
    @Published var currentNoteText: String = ""
    
    func saveActivity(habitId: String) {
        let activity = Activity(id: activityStore.count + 1, dateCompleted: .now, note: currentNoteText, habitId: habitId)
        activityStore.append(activity)
        clearInput()
    }
    
    func clearInput() {
        showAddActivitySheet = false
        currentNoteText = ""
    }
}
