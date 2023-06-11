//
//  HabitCalendarView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI

struct HabitCalendarView : UIViewRepresentable {
    
    let interval : DateInterval
    
    func makeUIView(context: Context) -> UICalendarView {
        let calendarView = UICalendarView()
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.availableDateRange = interval
        calendarView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        calendarView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        return calendarView
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
}
