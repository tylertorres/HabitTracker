//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/7/23.
//

import SwiftUI

struct AddActivityView: View {
    @ObservedObject var viewModel: SingleHabitViewModel
    
    var habitId: String
    
    var body: some View {
        VStack {
            Text("Add Activity")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Divider()
            
            Spacer()

            BorderedTextEditor(text: $viewModel.currentNoteText)
                .padding()
                .frame(height: 150)
            
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
            .padding()
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
