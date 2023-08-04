//
//  HabitTitleView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI

struct HeaderView : View {
    
    @Binding var showSheet : Bool
    
    var body: some View {
        VStack {
            Spacer()
            
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
        }
    }
    
    func addHabitAction() {
        showSheet.toggle()
    }
}

struct HabitTitleView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showSheet: .constant(true))
    }
}
