//
//  IconsView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/3/23.
//

import SwiftUI
import Iconoir

struct IconsView: View {
    let icons : [Iconoir] = Iconoir.allCases
    let gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 40) {
                    ForEach(icons, id: \.self) { icon in
                        IconCell(icon: icon, cornerRadius: 10)
                    }
                }
                .padding()
            }
            .navigationTitle("Pick An Icon")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}


struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView()
    }
}
