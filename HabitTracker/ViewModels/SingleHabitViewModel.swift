//
//  SingleHabitViewModel.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/7/23.
//

import Foundation

class SingleHabitViewModel : ObservableObject {
    
    @Published var activityStore: [Activity] = [
        Activity(id: 1, dateCompleted: .now, note: "", habitId: 3),
        Activity(id: 2, dateCompleted: .now.subtracting(days: 5), note: "this is a note v2", habitId: 7)
    ]
    @Published var showAddActivitySheet: Bool = false
    @Published var currentNoteText: String = ""
    
    func saveActivity(habitId: Int) {
        var activity = Activity(id: activityStore.count + 1, dateCompleted: .now, note: currentNoteText, habitId: habitId)
        activityStore.append(activity)
        clearInput()
    }
    
    func clearInput() {
        showAddActivitySheet = false
        currentNoteText = ""
    }
    
    
    
    
}
