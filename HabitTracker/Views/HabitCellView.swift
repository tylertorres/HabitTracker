//
//  HabitCellView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/9/23.
//

import SwiftUI

struct HabitCellView: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    let name : String
    let calendar : Calendar
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color(.systemGray3))
            
            VStack {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 0) // change this to get more of a semi-circle header
                        .fill(.blue)
                        .frame(height: 35)
                    
                    Text(name)
                        .colorInvert()
                        .lineLimit(1)
                        .minimumScaleFactor(0.01)
                        .padding(.horizontal)
                        .bold()
                }
                Spacer()
            }
            
        }
        .cornerRadius(10)
    }
}

struct HabitCellView_Previews: PreviewProvider {
    static var previews: some View {
        HabitCellView(name: "Reading", calendar: Calendar.current)
    }
}
