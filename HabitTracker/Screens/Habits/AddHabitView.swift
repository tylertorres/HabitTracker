//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 1/2/24.
//

import SwiftUI

struct AddHabitView: View {
    
    @ObservedObject var model: AddHabitModel
    
    init(model: AddHabitModel) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            TextField("Enter Habit Name...", text: $model.habitTextInput)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            
            HStack {
                Text("Select Habit Theme")
                    .font(.headline)
                Spacer()
                ThemePicker(selection: $model.selectedThemeColor)
                    .tint(.secondary)
            }
            
            VStack {
                Section {
                    
                } header: {
                    HStack {
                        Text("Add Previous Habit Activity")
                            .font(.headline)
                        Spacer()
                    }
                }
                
            }
            .padding(.vertical)
            
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

struct ThemePicker: View {
    @Binding var selection: ThemeColor
    
    var body: some View {
        Picker("Habit Theme", selection: $selection) {
            ForEach(ThemeColor.allCases) { theme in
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(theme.color)
                    Label(theme.name, systemImage: "paintpalette")
                        .padding(4)
                }
                .foregroundColor(theme.accentColor)
                .fixedSize(horizontal: false, vertical: true)
                .tag(theme)
            }
        }
        .pickerStyle(.menu)
    }
}

#Preview {
    NavigationStack {
        AddHabitView(model: AddHabitModel())
    }
    
}
