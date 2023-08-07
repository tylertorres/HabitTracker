//
//  EmptyHabitCell.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/7/23.
//

import SwiftUI

struct EmptyHabitCell: View {
    
    var body: some View     {
        // how can we make an empty with a border
        VStack(alignment: .center) {
            Text("Add Your First Habit Here!")
                .font(.title)
                .minimumScaleFactor(0.5)
                .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
        .foregroundColor(Color.black)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1.5))
    }
    
    
    func onTap() {
        
    }
}

struct EmptyHabitCell_Previews: PreviewProvider {
    static var previews: some View {
        EmptyHabitCell()
    }
}
