//
//  HabitCellView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/9/23.
//

import SwiftUI

struct HabitCellView: View {
    
    let name : String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(systemName: "dumbbell.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            Spacer()
            Text(name)
                .font(.title)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
        .foregroundColor(.black)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct HabitCellView_Previews: PreviewProvider {
    static var previews: some View {
        HabitCellView(name: "Reading")
    }
}
