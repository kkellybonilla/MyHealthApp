//
//  Date+Utilities.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzman on 1/13/25.
//

import Foundation

extension Date {
    /// Helper function to create a Date object
    ///
    /// - Returns date object with given components if successful, otherwise returns current date
    static func createDateFromComponents(
        calendar: Calendar,
        timeZone: TimeZone? = nil,
        era: Int? = nil,
        year: Int? = nil,
        month: Int? = nil,
        day: Int? = nil,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil,
        nanosecond: Int? = nil,
        weekday: Int? = nil,
        weekdayOrdinal: Int? = nil,
        quarter: Int? = nil,
        weekOfMonth: Int? = nil,
        weekOfYear: Int? = nil,
        yearForWeekOfYear: Int? = nil
    ) -> Date {
        let dateComponents = DateComponents(
            calendar: calendar,
            timeZone: timeZone,
            era: era,
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute,
            second: second,
            nanosecond: nanosecond,
            weekday: weekday,
            weekdayOrdinal: weekdayOrdinal,
            quarter: quarter,
            weekOfMonth: weekOfMonth,
            weekOfYear: weekOfYear,
            yearForWeekOfYear: yearForWeekOfYear)
        
        let date = calendar.date(from: dateComponents)
        return date ?? Date()
    }
}
