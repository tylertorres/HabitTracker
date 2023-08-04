//
//  IconsView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/3/23.
//

import SwiftUI
import Iconoir

struct IconsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedIcon: Iconoir
    
    let icons : [Iconoir] = Iconoir.allCases
    let gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 40) {
                ForEach(icons, id: \.self) { icon in
                    Button(
                        action: {
                            selectedIcon = icon
                            withAnimation {
                                dismiss()
                            }
                        }) {
                            IconCell(icon: icon, cornerRadius: 10)
                        }
                    .tint(.black)
                }
            }
            .padding()
        }
        .navigationTitle("Pick An Icon")
    }
}


struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView(selectedIcon: .constant(Iconoir.refresh))
    }
}
