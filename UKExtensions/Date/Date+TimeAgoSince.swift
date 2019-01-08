//
//  Date+TimeAgoSince.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 1/7/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import Foundation

typealias DateCompomentsTuple = (Int?, Int?, Int?, Int?, Int?, Int?, Int?)

public extension Date {
    public static func timeAgoSinceNow(numeric numericDates: Bool) -> String {
        return timeAgo(since: Date(), numericDates: numericDates)
    }
    
    public static func timeAgo(since date: Date, numericDates: Bool) -> String {
        
        let calendar = Calendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = Date()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now as Date) ? date : now
        let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
        
        let dateCompoments = (components.year, components.month, components.weekOfYear, components.day, components.hour, components.minute, components.second)
        return createAgoString(dateCompoments: dateCompoments, numericDates: numericDates)
    }
    
    public static func testDateSinceSometime() {
        let date = Date(timeIntervalSinceNow: 60)
        debugPrint(Date.timeAgo(since: Date(timeInterval: 0, since: date), numericDates: false))
    }
    
    private static func createAgoString(dateCompoments: DateCompomentsTuple, numericDates: Bool) -> String {
        let years =  dateCompoments.0!
        let months = dateCompoments.1!
        let weeks = dateCompoments.2!
        let days = dateCompoments.3!
        let hours = dateCompoments.4!
        let minutes = dateCompoments.5!
        let seconds = dateCompoments.6!
        
        switch (dateCompoments) {
        case (years, _, _, _, _, _, _):
            if (years >= 2) {
                return "\(years) years ago"
            } else if (years >= 1) {
                guard numericDates else { return "Last year" }
                return "1 year ago"
            }
            fallthrough
            
        case (_, months, _, _, _, _, _):
            if (months >= 2) {
                return "\(months) months ago"
            } else if (months >= 1) {
                guard numericDates else { return "Last month" }
                return "1 month ago"
            }
            fallthrough
            
        case (_, _, weeks, _, _, _, _):
            if (weeks >= 2) {
                return "\(weeks) weeks ago"
            } else if (weeks >= 1) {
                guard numericDates else { return "Last week" }
                return "1 week ago"
            }
            fallthrough
            
        case (_, _, _, days, _, _, _):
            if (days >= 2) {
                return "\(days) days ago"
            } else if (days >= 1) {
                guard numericDates else { return "Yesterday" }
                return "1 day ago"
            }
            fallthrough
            
        case (_, _, _, hours, _, _, _):
            if (hours >= 2) {
                return "\(hours) hours ago"
            } else if (hours >= 1) {
                guard numericDates else { return "An hour ago" }
                return "1 hour ago"
            }
            fallthrough
            
        case (_, _, _, _, minutes, _, _):
            if (minutes >= 2) {
                return "\(minutes) minutes ago"
            } else if (minutes >= 1) {
                guard numericDates else { return "A minute ago" }
                return "1 minute ago"
            }
            fallthrough
            
        case (_, _, _, _, _, _, seconds):
            if (seconds >= 10) {
                return "\(seconds) seconds ago"
            }
            return "Just now"
            
        default: break
        }
        return ""
    }
    
}

public extension Date {
    public func earlierDate(_ date:Date) -> Date {
        return (self.timeIntervalSince1970 <= date.timeIntervalSince1970) ? self : date
    }
    
    public func laterDate(_ date:Date) -> Date {
        return (self.timeIntervalSince1970 >= date.timeIntervalSince1970) ? self : date
    }
}
