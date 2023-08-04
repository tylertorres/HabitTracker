//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI
import Iconoir

struct HabitsView: View {
    
    @State private var habits : [Habit] = [
        Habit(id: 1, name: "Read 10 Pages"),
        Habit(id: 1, name: "Walk a Mile"),
        Habit(id: 1, name: "Code 1 component"),
        Habit(id: 1, name: "Learn Spanish"),
        Habit(id: 1, name: "Learn Latin"),
    ]
    @State private var showAddHabitSheet : Bool = false
    @State private var habitNameInput = ""
    
    private let twoColumnGridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                LazyVGrid(columns: twoColumnGridLayout, spacing: 30) {
                    
                    ForEach(habits, id: \.self) { item in
                        HabitCellView(name: item.name)
                            .frame(width: 175, height: 175)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HeaderView(showSheet: $showAddHabitSheet)
                    }
                }
            }
            .padding()
            .background(Color(.sRGB, white: 0.95, opacity: 1.0))
        }
        .sheet(isPresented: $showAddHabitSheet) {
            NavigationView {
                ModalView(userInput: $habitNameInput, show: $showAddHabitSheet)
                    .environment(\.colorScheme, .light)
            }
        }
    }
}

struct ModalView: View {
    
    @Binding var userInput: String
    @Binding var show: Bool
    
    @State var icon : Iconoir = Iconoir.refresh
    
    var body: some View {
        VStack {
            MaterialTextField()
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
            ActionButtonRow(shouldDismiss: $show)
        }
        .padding()
        .navigationTitle("Add New Habit")
    }
}

struct MaterialTextField: View {
    @State private var text = ""
    @State private var isEditing = false
    @State private var isDone = false
    
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
    
    var body : some View {
        
        HStack {
            Button(action: onCancel) { Text("Cancel") }
            Spacer()
            Button(action: onSave) { Text("Add Habit") }
        }
        .padding()
    }
    
    private func onSave() {
        print("Save")
    }
    
    private func onCancel() {
        shouldDismiss.toggle()
    }
}

struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
