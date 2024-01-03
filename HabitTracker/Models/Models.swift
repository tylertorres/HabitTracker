//
//  Models.swift
//  HabitTracker
//
//  Created by Tyler Torres on 1/2/24.
//

import Foundation
import SwiftUI

struct Habit: Identifiable {
    let id: UUID = UUID()
    let name: String
    let theme: ThemeColor
    let completedActivities: [Activity]
}

struct Activity: Identifiable {
    var id: UUID = UUID()
    let dateCompleted: Date
    var note: String
}


enum ThemeColor: String, Identifiable, CaseIterable {
    case red
    case blue
    case green
    case yellow
    case pink
    case purple
    case orange
    case gray
    case mint
    case teal
    case cyan
    case indigo
    case brown
    
    var id: Self { self }
    
    var color: Color {
        switch self {
        case .red: 
            return Color.red
        case .blue: 
            return Color.blue
        case .green:
            return Color.green
        case .yellow:
            return Color.yellow
        case .pink:
            return Color.pink
        case .purple:
            return Color.purple
        case .orange:
            return Color.orange
        case .gray:
            return Color.gray
        case .mint:
            return Color.mint
        case .teal:
            return Color.teal
        case .cyan:
            return Color.cyan
        case .indigo:
            return Color.indigo
        case .brown:
            return Color.brown
        }
    }
    
    var accentColor: Color {
        switch self {
        case .red, .blue, .green, .purple, .indigo, .brown:
            return .white
        case .yellow, .pink, .orange, .mint, .teal, .cyan, .gray:
            return .black
        }
    }

    
    var name: String { self.rawValue.capitalized }
    
}


extension Habit {
    static let mock = Self(
        name: "Coded in Swift",
        theme: ThemeColor.indigo,
        completedActivities: [
            Activity(dateCompleted: .now, note: "Learned more about Navigation"),
            Activity(dateCompleted: .now, note: "Learned about side effects when using Speech Recognition from pointfree.com"),
        ]
    )
}
