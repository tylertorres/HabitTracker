//
//  Date+Ext.swift
//  HabitTracker
//
//  Created by Tyler Torres on 8/8/23.
//

import Foundation

extension Date {
    
    func adding(days: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: days, to: self) ?? self
    }
    
    func subtracting(days: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: -days, to: self) ?? self
    }
    
}
