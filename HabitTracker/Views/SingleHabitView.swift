//
//  SingleHabitView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI
import Iconoir

struct SingleHabitView: View {
    @State var currentHabit : Habit
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView {
                HabitCalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))
            }
            .padding()
            .navigationTitle(currentHabit.name)
        }
        
    }
}

struct SingleHabitView_Previews: PreviewProvider {
    static var previews: some View {
        SingleHabitView(currentHabit: Habit(id: 1, name: "Read For 30 Minutes", icon: Iconoir.refresh.rawValue))
    }
}
