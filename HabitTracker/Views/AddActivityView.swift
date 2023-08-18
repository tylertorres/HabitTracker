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
    var habitId: String
    
    var body: some View {
        VStack {
            Text("Add Activity")
                .padding()
            Divider()
            Text("Habit Completed?")
                .padding()
            HStack {
                Button("No") { viewModel.showAddActivitySheet.toggle() }
                Button("Yes") { isHabitCompleted = true }
            }
            TextEditor(text: $viewModel.currentNoteText)
                .padding()
                .frame(height: 100)
                .textFieldStyle(.roundedBorder)
                .background(RoundedRectangle(cornerRadius: 25).strokeBorder(Color.gray, lineWidth: 1))
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.gray, lineWidth: 1.5))
                .padding()
                .disabled(!isHabitCompleted)
            Spacer()
            Button(action: { viewModel.saveActivity(habitId: habitId) }) {
                Text("Save Activity")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25).fill(isHabitCompleted ? Color.black : Color.clear))
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1.5))
                    .foregroundColor(isHabitCompleted ? Color.white : Color.black)
            }
            .disabled(!isHabitCompleted)
            .padding()
            .animation(.easeInOut, value: isHabitCompleted)
        }
        .presentationDetents([.medium])
        .presentationCornerRadius(25)
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(viewModel: SingleHabitViewModel(), habitId: UUID().uuidString)
    }
}
