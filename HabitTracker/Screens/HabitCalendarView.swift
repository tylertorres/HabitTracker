//
//  HabitCalendarView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI

struct HabitCalendarView : UIViewRepresentable {
    @ObservedObject var viewModel: SingleHabitViewModel
    
    let interval : DateInterval
    
    func makeUIView(context: Context) -> UICalendarView {
        let calendarView = UICalendarView()
        
        // Config
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.availableDateRange = interval
        calendarView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        calendarView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        // Selection
        calendarView.delegate = context.coordinator
        calendarView.selectionBehavior = UICalendarSelectionSingleDate(delegate: context.coordinator)

        return calendarView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self, viewModel: viewModel)
    }
    
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {}
    
    
    class Coordinator : NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
        @ObservedObject var viewModel: SingleHabitViewModel

        var parent: HabitCalendarView
        
        init(parent: HabitCalendarView, viewModel: SingleHabitViewModel) {
            self.parent = parent
            self.viewModel = viewModel
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            guard dateComponents != nil else { return }
            viewModel.showAddActivitySheet.toggle()
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
    }
    
}
