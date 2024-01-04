//
//  HabitsList.swift
//  HabitTracker
//
//  Created by Tyler Torres on 1/2/24.
//

import SwiftUI

struct HabitList: View {
    
    @ObservedObject var model: HabitsModel
    
    var body: some View {
        NavigationStack(path: $model.path) {
            List {
                ForEach(self.model.habits) { habit in
                    Button {
                        
                    } label: {
                        HabitsListRow(habit: habit)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.model.addHabitButtonTapped()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(item: $model.destination) { destination in
                switch destination {
                case let .addHabit(model):
                    NavigationStack {
                        AddHabitView(model: model)
                            .navigationTitle("Add Habit")
                            .navigationBarTitleDisplayMode(.large)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Dismiss") {
                                        self.model.dismissButtonTapped()
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Confirm") {
                                        self.model.confirmButtonTapped()
                                    }
                                }
                            }
                    }
                case let .habitDetail(model):
                    HabitDet
                }
            }
        }
    }
}



#Preview {
    HabitList(model: HabitsModel(habits: [.mock]))
}
