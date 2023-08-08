//
//  SingleHabitView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI
import Iconoir

struct SingleHabitView: View {
    @StateObject var viewModel: SingleHabitViewModel = SingleHabitViewModel()
    @State var currentHabit : Habit
    
    var body: some View {
        VStack(alignment: .leading) {
            HabitCalendarView(viewModel: viewModel, interval: DateInterval(start: .distantPast, end: .distantFuture))
            Divider()
            List {
                ForEach(viewModel.activityStore.reversed(), id: \.id) { activity in
                    HStack {
                        Text("\(activity.dateCompleted.formatted(date: .abbreviated, time: .omitted))")
                            .font(.title3)
                        Spacer()
                        if !activity.note.isEmpty {
                            Iconoir.notes.asImage
                        }
                    }
                    .padding()
                }
            }
            .listStyle(.plain)
        }
        .padding()
        .sheet(isPresented: $viewModel.showAddActivitySheet) {
            AddActivityView(viewModel: viewModel, habitId: currentHabit.id)
        }
        .navigationTitle(currentHabit.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SingleHabitView_Previews: PreviewProvider {
    static var previews: some View {
        SingleHabitView(currentHabit: Habit(id: 1, name: "Read For 30 Minutes", icon: Iconoir.refresh.rawValue))
    }
}
