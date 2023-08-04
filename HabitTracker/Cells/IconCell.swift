//
//  IconCell.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/3/23.
//

import SwiftUI
import Iconoir

struct IconCell: View {
    let icon: Iconoir
    let cornerRadius: CGFloat?
    
    init(icon: Iconoir, cornerRadius: CGFloat? = nil) {
        self.icon = icon
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        VStack {
            icon.asImage
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius ?? 0))
        .overlay(RoundedRectangle(cornerRadius: cornerRadius ?? 0).stroke(Color.secondary))
    }
}

struct IconCell_Previews: PreviewProvider {
    static var previews: some View {
        IconCell(icon: Iconoir.addDatabaseScript)
    }
}
