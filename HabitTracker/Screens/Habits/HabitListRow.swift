//
//  HabitsListRow.swift
//  HabitTracker
//
//  Created by Tyler Torres on 1/2/24.
//

import SwiftUI

struct HabitListRow: View {
    
    let habit: Habit
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(self.habit.name)
                    .font(.title2.bold())
                    .font(.title2.bold())
                Text("Last completed on: ")
                    .font(.subheadline)
            }
            .foregroundStyle(habit.theme.accentColor)
            Spacer()
            
            //TODO: use iconoir for the icons
            Image(systemName: "sun.max.fill")
                .foregroundStyle(habit.theme.accentColor)
        }
        .padding()
        .background(habit.theme.color, in: RoundedRectangle(cornerRadius: 8))
    }
}
#Preview {
    HabitListRow(habit: .mock)
}
