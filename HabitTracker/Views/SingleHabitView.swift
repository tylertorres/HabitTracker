//
//  SingleHabitView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI

struct SingleHabitView: View {
    
    @State var currentHabit : Habit
    
    var body: some View {
        HabitCalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))
    }
}

struct SingleHabitView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                SingleHabitView(currentHabit: Habit(id: 1, name: "Read", userId: "dklafjlsdfn", completedActivities: []))
            }
        }
    }
}
