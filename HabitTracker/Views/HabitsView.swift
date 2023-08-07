//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI
import Iconoir


struct HabitsView: View {
    @StateObject private var viewModel: HabitsViewModel = HabitsViewModel()
    
    private let twoColumnGridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: twoColumnGridLayout, spacing: 30) {
                    if viewModel.habits.isEmpty {
                        Button(action: { viewModel.showAddHabitSheet.toggle() }) {
                            EmptyHabitCell()
                                .frame(width: 175, height: 175)
                        }
                    }
                    ForEach(viewModel.habits, id: \.self) { habit in
                        NavigationLink(destination: SingleHabitView(currentHabit: habit)) {
                            HabitCellView(name: habit.name)
                                .frame(width: 175, height: 175)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding()
            .background(Color(.sRGB, white: 0.95, opacity: 1.0))
            .navigationTitle("Habits")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { viewModel.showAddHabitSheet.toggle() }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 34))
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showAddHabitSheet) {
            NavigationView {
                ModalView(viewModel: viewModel)
                    .environment(\.colorScheme, .light)
            }
        }
    }
}

struct ModalView: View {
    @ObservedObject var viewModel: HabitsViewModel
    @State var icon : Iconoir = Iconoir.refresh
    
    var body: some View {
        VStack {
            MaterialTextField(text: $viewModel.habitNameInput)
                .padding(.top, 20)
            
            HStack (alignment: .center) {
                NavigationLink(destination: IconsView(selectedIcon: $icon)) {
                    Text("Choose Icon")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
                IconCell(icon: icon, cornerRadius: 10)
            }
            .padding(.top, 30)
            
            Spacer()
            ActionButtonRow(shouldDismiss: $viewModel.showAddHabitSheet, onSave: viewModel.saveNewHabit2)
        }
        .padding()
        .navigationTitle("Add New Habit")
    }
}

struct MaterialTextField: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text("Habit Name")
                .font(.caption)
                .foregroundColor(isEditing ? .black : .gray)
                .offset(y: isEditing ? -35 : 0)
                .animation(.spring(response: 0.4, dampingFraction: 0.45), value: isEditing)
                .padding()
            
            TextField("", text: $text, onEditingChanged: { editing in
                isEditing = editing
            })
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isEditing ? Color.blue : Color.gray, lineWidth: 2)
            )
            .animation(.linear, value: isEditing)
        }
    }
}


struct ActionButtonRow : View {
    @Binding var shouldDismiss : Bool
    var onSave: () -> Void
    
    var body : some View {
        HStack {
            Button("Cancel") { shouldDismiss.toggle() }
            Spacer()
            Button("Add Habit", action: onSave)
        }
        .padding()
    }
}

struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
