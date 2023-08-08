//
//  SingleHabitViewModel.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/7/23.
//

import Foundation

class SingleHabitViewModel : ObservableObject {
    
    @Published var activityStore: [Activity] = [
        Activity(id: 1, dateCompleted: .now, note: "", habitId: UUID()),
        Activity(id: 2, dateCompleted: .now.subtracting(days: 5), note: "this is a note v2", habitId: UUID())
    ]
    @Published var showAddActivitySheet: Bool = false
    @Published var currentNoteText: String = ""
    
    func saveActivity() {
        // 1. Gather input
        // 2. Create Activity Instance w/ passed in habitId
        // 3. Append it to activity store and send off to be saved in db optimistically
    }
    
    
    
    
}
