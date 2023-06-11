//
//  HabitTitleView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI

struct HabitTitleView : View {
    
    var body: some View {
        
        HStack {
            Text("Habits")
                .font(.system(size: 34, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: addHabitAction) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 34))
                    .foregroundColor(.primary)
            }
        }
        .background(Color(UIColor.systemBackground)
        .edgesIgnoringSafeArea(.top))
    
    }
    
    func addHabitAction() {
        print("Added Habit!")
    }
}

struct HabitTitleView_Previews: PreviewProvider {
    static var previews: some View {
        HabitTitleView()
    }
}
