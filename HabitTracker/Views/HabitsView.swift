//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI

struct HabitsView: View {
    
    private var habits : [Habit] = [ // these will eventually be retrieved by the habit event store
        Habit(name: "Read", datesCompleted: []),
        Habit(name: "Take Vitamins", datesCompleted: []),
        Habit(name: "Code 1 Hour", datesCompleted: []),
        Habit(name: "Workout", datesCompleted: []),
        Habit(name: "Engage In Swift Course", datesCompleted: []),
    ]
    
    let twoColumnGridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVGrid(columns: twoColumnGridLayout, spacing: 30) {
                    
                    ForEach(habits, id: \.self) { item in
                        HabitCellView(name: item.name, calendar: Calendar.current)
                            .frame(width: 150, height: 150)
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HabitTitleView()
                    }
                }
            }
        }
    }
    
    func addHabitAction() {
        print("Added Habit!")
    }
}

struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
