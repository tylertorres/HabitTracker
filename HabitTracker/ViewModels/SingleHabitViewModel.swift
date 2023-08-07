//
//  SingleHabitViewModel.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/7/23.
//

import Foundation

class SingleHabitViewModel : ObservableObject {
    
    @Published var showAddActivitySheet: Bool = false
    @Published var currentNoteText: String = ""
    
    func saveActivity() {}
    
}
