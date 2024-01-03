//
//  HabitsListRow.swift
//  HabitTracker
//
//  Created by Tyler Torres on 1/2/24.
//

import SwiftUI

struct HabitsListRow: View {
    
    let habit: Habit
    
    var body: some View {
        HStack {
            VStack {
                Text(self.habit.name)
                Text("Last completed on: ")
            }
            Spacer()
            
            //TODO: use iconoir for the icons
            
        }
    }
}
#Preview {
    HabitListRow()
}
