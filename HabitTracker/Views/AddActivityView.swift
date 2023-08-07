//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/7/23.
//

import SwiftUI

struct AddActivityView: View {
    @ObservedObject var viewModel: SingleHabitViewModel
    @State private var isHabitCompleted: Bool = false
    
    
    var body: some View {
        VStack {
            Text("Add Activity")
            Divider()
            Text("Habit Completed?")
            HStack {
                Button("No") { viewModel.showAddActivitySheet.toggle() }
                Button("Yes") {}
            }
            TextField("", text: $viewModel.currentNoteText)
        }
        .presentationDetents([.medium])
        .presentationCornerRadius(25)
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(viewModel: SingleHabitViewModel())
    }
}
