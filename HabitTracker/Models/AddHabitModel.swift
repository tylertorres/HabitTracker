//
//  AddHabitModel.swift
//  HabitTracker
//
//  Created by Tyler Torres on 1/2/24.
//

import Foundation


class AddHabitModel: ObservableObject {
    let id = UUID()
    
    @Published var habitTextInput = ""
    @Published var selectedThemeColor: ThemeColor
    
    init(habitTextInput: String = "", selectedThemeColor: ThemeColor = .gray) {
        self.habitTextInput = habitTextInput
        self.selectedThemeColor = selectedThemeColor
    }
}

